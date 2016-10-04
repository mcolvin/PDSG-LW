figures<- function(n)
	{
	if(n==1)
		{
		p<-xyplot(weight/1000~length|as.factor(year),dat$Kn,group=basin,auto.key=TRUE,
			xlab="Length (mm)", ylab="Weight (kg)")
		return(p)		
		}
		
	if(n==2)
		{
		p<-xyplot(lwgh~llen|as.factor(year),
			groups=basin,     
			data= dat$Kn,auto.key=TRUE,
			#scales=list(y=list(log=T),x=list(log=T)),
			panel = panel.superpose,
			panel.groups = function(x, y,col,col.symbol,...) 
				{
				panel.xyplot(x, y,col=col.symbol,...)
				panel.lmline(x,y,col=col.symbol)
				}	,	
			grid=TRUE,
			xlab="Log(Length)", ylab="Log(Weight)")
		return(p)		
		}		
	if(n==3)
		{
		# WEIGHT OVER JULIAN DAY
		p<-xyplot(kn~jday|year_f,lw,group=basin,auto.key=TRUE,xlab="Day of year", ylab="Condition")
		return(p)
		}		
	if(n==4)
		{
		pdat<- tables(4)
		par(mfrow=c(4,1),mar=c(2,4,0,0),oma=c(1,1,1,1))

		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
		ylims<-range(unlist(pdat[which(pdat$length==len & pdat$jday== 92),c(9,10)]))
		plot(weight~year,pdat,subset=length==len & jday== 92 , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len &basin=="LB"& jday== 92)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len &basin=="UB"& jday== 92)
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("800 mm")
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len& pdat$jday== 92),c(9,10)]))
		plot(weight~year,pdat,subset=length==len & jday== 92 , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB"& jday== 92)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len & basin=="UB"& jday== 92)
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("1000 mm")

		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len& pdat$jday== 92),c(9,10)]))
		plot(weight~year,pdat,subset=length==len & jday== 92 , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB"& jday== 92)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len &basin=="UB"& jday== 92)
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("1200 mm")
		# 1400 mm
		len<- 1400
		ylims<-range(unlist(pdat[which(pdat$length==len& pdat$jday== 92),c(9,10)]))
		plot(weight~year,pdat,subset=length==len  & jday== 92, type='n',
			ylim=ylims,ylab="",las=1)
		
		segdat<-subset(pdat, length==len & basin=="LB"& jday== 92)
		segdat$year<- segdat$year-0.05	
		#points(weight~year,segdat, type='p',pch=19,cex=1)
		#segments(x0=segdat$year,y0=segdat$lci,
		#	x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len &basin=="UB"& jday== 92)
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		legend("bottomright", c("Lower Basin","Upper Basin"),
			pch=c(19,17),col=c("black","red"),cex=0.75, bty='n')
		panLab("1400 mm")
		}
	


	
		
	if(n==5)
		{
		tmp<-tables(4)
		pdat<- tmp$lower		
		plot(kn~year,pdat,subset=length==800 , type='n',
			ylim=c(0.5,1),pch=16,cex=.6,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		segdat<-subset(pdat, length==800)
		points(kn~year,segdat, type='b',pch=16,cex=.6)
		segments(x0=segdat$year,y0=segdat$kn_lci,
			x1=segdat$year,	y1=segdat$kn_uci)
		segdat<-subset(pdat, length==1000)
		points(kn~year,segdat, type='b', pch=16,cex=.6)
		segments(x0=segdat$year,y0=segdat$kn_lci,
			x1=segdat$year,	y1=segdat$kn_uci)
		segdat<-subset(pdat, length==1200)
		points(kn~year,segdat, type='b', pch=16,cex=.6)
		segments(x0=segdat$year,y0=segdat$kn_lci,
			x1=segdat$year,	y1=segdat$kn_uci)
		panLab("A) Lower basin")			
	
		}
		
}