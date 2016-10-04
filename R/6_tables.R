tables<-function(n)
	{
	if(n==1)
		{
		out<- dcast(hatchery2, segment_id~year+origin,value.var="llength",length)
		return(out)
		}
	if(n==2)
		{
		out<-dcast(hatchery2,hatchery~year,value.var="llength",length)
		return(out)
		}
	if(n==3)
		{
		tmp<-dcast(hatchery2, hatchery~year2,value.var="f_id",fun=length)
		return(tmp)		
		
		}
	if(n==4)
		{
		# MEAN WEIGHT AT LENGTH FOR UPPER AND LOWER BASIN FISH
		pdat<-expand.grid(length=c(600,800,1000,1200,1400,1600),
			#jday=c(92,122,153,183,214,245,275), # APRIL 1 TO OCTOBER 1
			jday=c(92:275), # APRIL 1 TO OCTOBER 1
			year_f=unique(lw$year_f),basin=unique(lw$basin))
		pdat$jdaysq<- pdat$jday^2
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
