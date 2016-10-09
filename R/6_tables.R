tables<-function(n)
	{
	if(n==1)
		{
		out<- ddply(lw, .(basin,year),summarize,
			length.mean=mean(length),
			length.min=min(length),
			length.max=max(length),
			weight.mean=mean(weight),
			weight.min=min(weight),
			weight.max=max(weight)	,
			kn_mean=mean(na.omit(kn)),
			kn_std=sd(na.omit(kn))
			)
		return(out)
		}
	if(n==2)
		{# MODEL SELECTION TABLE		
		modsel <- model.sel("~length"=fit01,
			"~len+basin"=fit02,
			"~len+basin+llen:basin"=fit03,
			"~llen+year"=fit04,
			"~llen+year+llen:year"=fit05,
			"~llen+year+basin"=fit06,
			"~llen+llen+year+year:basin"=fit07,
			"~year+llen+basin+llen:basin"=fit08,
			"~llen+year+basin+llen:year"=fit09,
			"~len+year+basin+llen:basin+llen:year+basin:year+len:basin:year"=fit)
		modsel<-as.data.frame(modsel)
		out<- modsel[,c("df","logLik","AICc","delta","weight")]
		out$model<- rownames(out)
		out<- out[,c(6,1,2,3,4,5)]
		rownames(out)<-c(1:nrow(out))
		return(format(out,digits=2))
		}
	if(n==4)
		{
		# MEAN WEIGHT AT LENGTH FOR UPPER AND LOWER BASIN FISH
		pdat<-expand.grid(length=c(600,800,1000,1200,1400,1600),
			year_f=unique(lw$year_f),
			basin=unique(lw$basin))
		pdat$llen<- log(pdat$length)
		pdat$lwgh<- predict(fit,pdat)
		pdat$lwgh_se<-predict(fit,pdat,se.fit=TRUE,interval="confidence")$se.fit
		pdat$lci<- exp(pdat$lwgh-1.96*pdat$lwgh_se)
		pdat$uci<- exp(pdat$lwgh+1.96*pdat$lwgh_se)
		pdat$weight<- exp(pdat$lwgh)
		pdat$year<-as.numeric(as.character(pdat$year_f))
		pdat$kn<- pdat$weight/ 10^(-6.378 + 3.357*log10(pdat$length))
		pdat$kn_lci<- pdat$lci/ 10^(-6.378 + 3.357*log10(pdat$length))
		pdat$kn_uci<- pdat$uci/ 10^(-6.378 + 3.357*log10(pdat$length))
		pdat<- pdat[order(pdat$year,pdat$length),]
		return(pdat)
		}

}




