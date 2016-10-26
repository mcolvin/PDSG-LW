figures<- function(n,form=NULL)
	{
	if(n==1)
		{
        par(mfrow=c(4,4),mar=c(0,0,1,1),oma=c(6,6,1,1))
        ord<- c(2015,2016,-99,-99,2011:2014,2007:2010,2003:2006)
        xtcklab<- c(rep(FALSE,12),rep(TRUE,4))
        ytcklab<- rep(FALSE,16)
        ytcklab[c(1,5,9,13)]<-TRUE
        for(i in 1:length(ord))
            {
            if(ord[i]>0){
                
                plot(weight/1000~length,dat$Kn,subset=year==ord[i],xaxt='n',type='n',
                    xlab="",ylab="",yaxt='n',xlim=c(200,1600),ylim=c(0,23))
                points(weight/1000~length,dat$Kn,subset=year==ord[i]& basin=="LB",col='grey',pch='.',cex=4)   
                points(weight/1000~length,dat$Kn,subset=year==ord[i]& basin=="UB",col='black',pch='.',cex=4) 
                axis(1,at=axTicks(1),labels=xtcklab[i], tck=0.02,line=0)
                axis(3,at=axTicks(1),labels=FALSE, tck=0.02)
                axis(2,at=axTicks(2),labels=ytcklab[i], tck=0.02,las=1,line=0)
                axis(3,at=axTicks(2),labels=FALSE, tck=0.02) 
                panLab(ord[i])

                }else{plot.new()}
            }  
                   mtext(side=1,"Total length, cm",outer=TRUE,line=3,cex=1.3)
                mtext(side=2,"Weight, kg",outer=TRUE,line=3,cex=1.3)     
            legend("bottomright",c("Lower basin","Upper basin"), pch=15,col=c("black","grey"),bty='n')
		}
		
	if(n==2)
		{ # plot of log length v log weight and best fit lines
        
          par(mfrow=c(4,4),mar=c(0,0,1,1),oma=c(6,6,1,1))
        ord<- c(2015,2016,-99,-99,2011:2014,2007:2010,2003:2006)
        xtcklab<- c(rep(FALSE,12),rep(TRUE,4))
        ytcklab<- rep(FALSE,16)
        ytcklab[c(1,5,9,13)]<-TRUE
        for(i in 1:length(ord))
            {
            if(ord[i]>0){
                
                plot(lwgh~llen,dat$Kn,subset=year==ord[i],xaxt='n',type='n',
                    xlab="",ylab="",yaxt='n',xlim=c(log(200),log(1600)),ylim=c(3,10))
                points(lwgh~llen,dat$Kn,subset=year==ord[i]& basin=="LB",col='grey',pch='.',cex=4)   
                points(lwgh~llen,dat$Kn,subset=year==ord[i]& basin=="UB",col='black',pch='.',cex=4) 
                fitub<-lm(lwgh~llen,dat$Kn,subset=year==ord[i]& basin=="UB")
                fitlb<-lm(lwgh~llen,dat$Kn,subset=year==ord[i]& basin=="LB")
                abline(coef(fitlb)[1],coef(fitlb)[2],col="grey")
                abline(coef(fitub)[1],coef(fitub)[2],col="black")
                axis(1,at=axTicks(1),labels=xtcklab[i], tck=0.02,line=0)
                axis(3,at=axTicks(1),labels=FALSE, tck=0.02)
                axis(2,at=axTicks(2),labels=ytcklab[i], tck=0.02,las=1,line=0)
                axis(3,at=axTicks(2),labels=FALSE, tck=0.02) 
                panLab(ord[i])

                }else{plot.new()}
            }  
            mtext(side=1,"Total length, cm",outer=TRUE,line=3,cex=1.3)
            mtext(side=2,"Weight, kg",outer=TRUE,line=3,cex=1.3)     
            legend("bottomright",c("Lower basin","Upper basin"), pch=15,col=c("black","grey"),bty='n',
                lty=1)  
      	}		
	if(n==3)
		{
		boxplot(kn~year,lw,xlab="Year", ylab="Condition, unitless",subset=basin=="LB",
			at=sort(unique(lw$year))-0.15,boxwex=0.2,xaxt='n',yaxt='ns',cex.lab=1.3)
		boxplot(kn~year,lw,xlab="", ylab="",subset=basin=="UB",add=TRUE,
			xaxt='n',at=sort(unique(lw$year))+0.15,boxwex=0.2,col='grey',yaxt='n')
        axis(1, at=  sort(unique(lw$year)),tck=0.015) 
        axis(3, at=  sort(unique(lw$year)),labels=FALSE,tck=0.015) 
        axis(2, at=axTicks(2),tck=0.015,las=1)
        axis(4, at=axTicks(2),labels=FALSE,tck=0.015)
		legend("topleft",c("Lower basin","Upper basin"),fill=c("white","grey"),bty='n')
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
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("800 mm")
		abline(h=10^(-6.2561 + 3.2932*log10(len))/1000,lty=2)
		
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len & basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("1000 mm")
		abline(h=10^(-6.2561 + 3.2932*log10(len))/1000,lty=2)
		
		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len, type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		panLab("1200 mm")
		abline(h=10^(-6.2561 + 3.2932*log10(len))/1000,lty=2)
		# 1400 mm
		len<- 1400
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",las=1)
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1,col='red')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="red")		
		legend("bottomright", c("Lower Basin","Upper Basin"),
			pch=c(19,17),col=c("black","red"),cex=0.75, bty='n')
		panLab("1400 mm")
		mtext(side=2, "Expected weight (kg)",outer=TRUE, line=-0.5)
		mtext(side=1, "Year",outer=TRUE, line=-0.5)
		abline(h=10^(-6.2561 + 3.2932*log10(len))/1000,lty=2)
		}
	
	if(n==5)
		{
		pdat<- tables(4)
		kns<-tables(1)
		par(mfrow=c(3,1),mar=c(2,4,0,0),oma=c(1,1,1,1))

		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="")
		panLab("800 mm")
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="")
				panLab("1000 mm")
		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len, type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="")
				panLab("1200 mm")
		# 1400 mm
		#len<- 1400
		#ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		#plot(weight~year,pdat,subset=length==len  , type='n',
		#	ylim=ylims,ylab="",las=1)
#
		#segdat<-subset(pdat, length==len &basin=="LB")
		#segdat$year<- segdat$year+0.05
		#points(weight~year,segdat, type='p',pch=19,cex=1,col='black')
		#segments(x0=segdat$year,y0=segdat$lci,
		#	x1=segdat$year,	y1=segdat$uci,col="black")		
		#par(new=TRUE)
		#plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="")
		#panLab("1400 mm")
		mtext(side=2, "Predicted weight (kg)",outer=TRUE, line=-0.5)
		mtext(side=1, "Year",outer=TRUE, line=-0.5)
		legend("topright",c("Predicted weight","Condition"),pch=c(19,1))
		}
	if(n==6)
		{
		pdat<- tables(4)
		kns<-tables(1)
		par(mfrow=c(4,1),mar=c(2,4,0,0),oma=c(1,1,1,1))

		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="")
		panLab("800 mm")
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="")
				panLab("1000 mm")
		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len, type='n',
			ylim=ylims,ylab="",xaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE)
		
		segdat<-subset(pdat, length==len & basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1)
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="")
				panLab("1200 mm")
		# 1400 mm
		len<- 1400
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",las=1)

		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=19,cex=1,col='black')
		segments(x0=segdat$year,y0=segdat$lci,
			x1=segdat$year,	y1=segdat$uci,col="black")		
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="")
		panLab("1400 mm")
		mtext(side=2, "Predicted weight (kg)",outer=TRUE, line=-0.5)
		mtext(side=1, "Year",outer=TRUE, line=-0.5)
		legend("bottomright",c("Predicted weight","Condition"),pch=c(19,1))
		}
	

	if(n==7)
		{
		#' Why are 2016 upper basin fish heavier but kn is down?
		x<-data.frame(len=c(200:1600))
		x$llen<- log(x$len)
		fit2<-lm(lwgh~llen,lw,subset=year==2016 & basin=="UB")
		x$w<-exp(predict(fit2,x))
		x$ws<-10^(-6.2561 + 3.2932*log10(x$len))
		x$kn<-x$w/x$ws
		plot(kn~len,x,ylim=c(0.85,1.05),type='l',lwd=4,las=1,ylab="Condition",
			xlab="Length (mm)",xlim=c(200,1600))
		fit3<-lm(lwgh~llen, lw, subset=basin=="UB"&
			year==2015)
		x$w15<-exp(predict(fit3,x))
		x$kn15<-x$w15/x$ws
		points(kn15~len,x,col='grey',type='l',lwd=4)	
	
		par(new=TRUE)
		plot(density(lw[which(lw$year==2015 & lw$basin=="UB"),]$length),col="grey",lty=2,
			yaxt='n',xaxt='n',ylab="",xlab="",main="",xlim=c(200,1600))
		points(density(lw[which(lw$year==2016 & lw$basin=="UB"),]$length),col="black",lty=2,
			type='l')
		legend("top",legend=c(2015,2016),col=c("grey","black"),lwd=2,bg='white')

		}
	if(n==8)
		{
		#' Why are 2016 upper basin fish heavier but kn is down?
		x<-expand.grid(length=c(200:1200),
			basin=c("LB"),
			year_f=as.factor(c(2003:2016)))
		x<-rbind(x,expand.grid(length=c(200:1600),
			basin=c("UB"),
			year_f=as.factor(c(2003:2016)))	)
		
		x$llen<- log(x$length)
		x$w<-exp(predict(fit,x))
		x$ws<-10^(-6.2561 + 3.2932*log10(x$length))
		x$kn<-x$w/x$ws
		par(mfrow=c(2,1),mar=c(2,2,0,0),oma=c(2,2,1,1))
		plot(kn~length,x,lwd=4,las=1,ylab="Condition",ylim=c(0.68,1.2),
			xlab="Length (mm)",subset=basin=="LB",type='n')
		xx<-levels(x$year_f)
		cols<- grey(level=c(0:length(xx))/(length(xx)+1))
		sapply(1:length(xx),function(i)
			{
			points(kn~length,x,lwd=3,subset=basin=="LB" & year_f==xx[i],type='l',
				col=cols[i])
			return(NULL)
			})
		legend("top",legend=c(2003:2016),col=cols,lwd=4,bg='white',ncol=4,cex=0.5)
		panLab("Lower basin")		
		plot(kn~length,x,lwd=4,las=1,ylab="Condition",ylim=c(0.6,1.3),
			xlab="Length (mm)",subset=basin=="UB",type='n')
		xx<-levels(x$year_f)
		cols<- grey(level=c(0:length(xx))/(length(xx)+1))
		sapply(1:length(xx),function(i)
			{
			points(kn~length,x,lwd=3,subset=basin=="UB" & year_f==xx[i],type='l',
				col=cols[i])
			return(NULL)
			})		
		mtext(side=1, "Length (mm)",outer=TRUE,line=0)
		mtext(side=2, "Predicted condition",outer=TRUE,line=0.5)
		panLab("Upper basin")
		}

	
	if(n==55)
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