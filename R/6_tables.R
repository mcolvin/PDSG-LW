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
		modsel <- model.sel("~llen"=fit01,
			"~llen+basin"=fit02,
			"~llen+basin+llen:basin"=fit03,
			"~llen+year"=fit04,
			"~llen+year+llen:year"=fit05,
			"~llen+year+basin"=fit06,
			"~llen+year+year:basin"=fit07,
			"~year+llen+basin+llen:basin"=fit08,
			"~llen+year+basin+llen:year"=fit09,
			"~llen+year+basin+llen:basin+llen:year+basin:year+llen:basin:year"=fit)
		modsel<-as.data.frame(modsel)
		out<- modsel[,c("df","logLik","AICc","delta","weight")]
		out$model<- rownames(out)
		out<- out[,c(6,1,2,3,4,5)]
       
       for(i in 1:nrow(out))
        {
       out$r.squared[i]<- summary(lm(as.formula(paste("lwgh",out$model[i],sep="")),lw))$r.squared
        }
		rownames(out)<-c(1:nrow(out))
		return(format(out,digits=2))
		}
	if(n==4)
		{
		# MEAN WEIGHT AT LENGTH FOR UPPER AND LOWER BASIN FISH
		pdat<-expand.grid(length=c(200,400,600,800,1000,1200,1400,1600),
			year_f=unique(lw$year_f),
			basin=unique(lw$basin))
		pdat$llen<- log(pdat$length)
		pdat$llength<- log(pdat$length)
		pdat$lwgh<- predict(fit,pdat)
		pdat$lwgh_se<-predict(fit,pdat,se.fit=TRUE,interval="confidence")$se.fit
		pdat$lci<- exp(pdat$lwgh-1.96*pdat$lwgh_se)
		pdat$uci<- exp(pdat$lwgh+1.96*pdat$lwgh_se)
		pdat$weight<- exp(pdat$lwgh)
		pdat$year<-as.numeric(as.character(pdat$year_f))
		pdat$kn<- pdat$weight/ Ws(pdat$length)# NEW RANDALL MOD
		pdat$kn_lci<- pdat$lci/Ws(pdat$length)# NEW RANDALL MOD
		pdat$kn_uci<- pdat$uci/ Ws(pdat$length)# NEW RANDALL MOD
		pdat<- pdat[order(pdat$year,pdat$length),]
        pdat<-pdat[,-7]# drop se
		return(pdat)
		}
    if(n==5)
        {  
        fit<- lm(lwgh~llen*year_f*basin,lw)
        tmp<- data.frame()   
        yrs<-c(2011,2012)
        lens<-log(c(200,400,600,800,1000,1200))
        yy<-lsmeans(fit, ~ year_f |llen +basin, 
            at = list(llen = lens,
            basin="LB",
            year_f=factor(yrs,levels(lw$year_f))))
        yyy<-cld(yy,by="llen",details=TRUE)
        y<- exp(aggregate(lsmean~llen,yyy$lsmeans,mean)[,2])/1000
        tmp<- rbind(tmp,data.frame(yr1=yrs[1],yr2=yrs[2],lens=exp(lens),
            yyy$comparisons,y=y))
          
        yrs<-c(2012,2013)
        lens<-log(c(200,400,600,800,1000,1200))
        yy<-lsmeans(fit, ~ year_f |llen +basin, 
            at = list(llen = lens,
            basin="LB",
            year_f=factor(yrs,levels(lw$year_f))))
        yyy<-cld(yy,by="llen",details=TRUE)
        y<- exp(aggregate(lsmean~llen,yyy$lsmeans,mean)[,2])/1000
        tmp<- rbind(tmp,data.frame(yr1=yrs[1],yr2=yrs[2],lens=exp(lens),
            yyy$comparisons,y=y))
          
        yrs<-c(2013,2014)
        lens<-log(c(200,400,600,800,1000,1200))
        yy<-lsmeans(fit, ~ year_f |llen +basin, 
            at = list(llen = lens,
            basin="LB",
            year_f=factor(yrs,levels(lw$year_f))))
        yyy<-cld(yy,by="llen",details=TRUE)
        y<- exp(aggregate(lsmean~llen,yyy$lsmeans,mean)[,2])/1000
        tmp<- rbind(tmp,data.frame(yr1=yrs[1],yr2=yrs[2],lens=exp(lens),
            yyy$comparisons,y=y))
          
        yrs<-c(2014,2015)
        lens<-log(c(200,400,600,800,1000,1200))
        yy<-lsmeans(fit, ~ year_f |llen +basin, 
            at = list(llen = lens,
            basin="LB",
            year_f=factor(yrs,levels(lw$year_f))))
        yyy<-cld(yy,by="llen",details=TRUE)
        y<- exp(aggregate(lsmean~llen,yyy$lsmeans,mean)[,2])/1000
        tmp<- rbind(tmp,data.frame(yr1=yrs[1],yr2=yrs[2],lens=exp(lens),
            yyy$comparisons,y=y))
          
        yrs<-c(2015,2016)
        lens<-log(c(200,400,600,800,1000,1200))
        yy<-lsmeans(fit, ~ year_f |llen +basin, 
            at = list(llen = lens,
            basin="LB",
            year_f=factor(yrs,levels(lw$year_f))))
        yyy<-cld(yy,by="llen",details=TRUE)
        y<- exp(aggregate(lsmean~llen,yyy$lsmeans,mean)[,2])/1000
        tmp<- rbind(tmp,data.frame(yr1=yrs[1],yr2=yrs[2],lens=exp(lens),
            yyy$comparisons,y=y))
          
        tmp$x<- tmp$yr1+0.5
        return(tmp)
        } 
 
}




