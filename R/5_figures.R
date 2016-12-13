figures<- function(n,form=NULL)
	{
	if(n==1)
		{
        par(mfrow=c(4,4),mar=c(0,0,1,1),oma=c(6,6,1,1),cex.axis=1.5)
        ord<- c(2015,2016,-99,-98,2011:2014,2007:2010,2003:2006)
        xtcklab<- c(rep(FALSE,12),rep(TRUE,4))
        ytcklab<- rep(FALSE,16)
        ytcklab[c(1,5,9,13)]<-TRUE
        for(i in 1:length(ord))
            {
            if(ord[i]>0){
                
                plot(weight/1000~I(length/10),dat$Kn,subset=year==ord[i],xaxt='n',type='n',
                    xlab="",ylab="",yaxt='n',xlim=c(20,160),ylim=c(0,23))
                points(weight/1000~I(length/10),dat$Kn,subset=year==ord[i]& basin=="LB",
                    col='red',pch='.',cex=9)   
                points(weight/1000~I(length/10),dat$Kn,subset=year==ord[i]& basin=="UB",
                    col='black',pch='.',cex=9) 
                axis(1,at=axTicks(1),labels=xtcklab[i], tck=0.02,line=0)
                axis(3,at=axTicks(1),labels=FALSE, tck=0.02)
                axis(2,at=axTicks(2),labels=ytcklab[i], tck=0.02,las=1,line=0)
                axis(3,at=axTicks(2),labels=FALSE, tck=0.02) 
                panLab(ord[i],mag=1.6)

                }else{
                    plot.new()
                    if(ord[i]==-99){legend("bottomright",c("Lower basin","Upper basin"), 
                        pch=15,col=c("red","black"),bty='n',cex=2)}
                    }
            }  
            mtext(side=1,"Length, cm",outer=TRUE,line=3,cex=1.3)
            mtext(side=2,"Weight, kg",outer=TRUE,line=3,cex=1.3)     
            #legend("center",c("Lower basin","Upper basin"), pch=15,col=c("red","black"),bty='n')
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
                panLab(ord[i],mag=1)

                }else{plot.new()}
            }  
            mtext(side=1,"ln(Length), mm",outer=TRUE,line=3,cex=1.3)
            mtext(side=2,"Weight, kg",outer=TRUE,line=3,cex=1.3)     
            legend("bottomright",c("Lower basin","Upper basin"), pch=15,col=c("grey","black"),bty='n',
                lty=1)  
      	}		
	if(n==3)
		{
        tmp<- subset(lw, kn<2)
		boxplot(kn~year,tmp,xlab="Year", ylab="Condition, unitless",subset=basin=="LB",
			at=sort(unique(tmp$year))-0.15,boxwex=0.2,xaxt='n',yaxt='ns',cex.lab=1.3)
		boxplot(kn~year,tmp,xlab="", ylab="",subset=basin=="UB",add=TRUE,
			xaxt='n',at=sort(unique(tmp$year))+0.15,boxwex=0.2,col='grey',yaxt='n')
        axis(1, at=  sort(unique(tmp$year)),tck=0.015) 
        axis(3, at=  sort(unique(tmp$year)),labels=FALSE,tck=0.015) 
        axis(2, at=axTicks(2),tck=0.015,las=1)
        axis(4, at=axTicks(2),labels=FALSE,tck=0.015)
		legend("topleft",c("Lower","Upper"),fill=c("white","grey"),bty='n')
		}
		
	if(n==4)
		{
        
		pdat<- tables(4)
		par(mfrow=c(4,1),mar=c(2,4,0,0),oma=c(3,3,1,1),cex.axis=1.5)

		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',yaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(2, at=axTicks(2),labels=TRUE, tck=0.02,las=1)
		axis(3, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(4, at=axTicks(2),labels=FALSE, tck=0.02)
		
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.6,col="grey")
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="grey")
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1.6,col='black')
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="black")		
		panLab("80 cm",mag=1)
		abline(h=Ws(L=len)/1000,lty=2)
		
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',yaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(2, at=axTicks(2),labels=TRUE, tck=0.02,las=1)
		axis(3, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(4, at=axTicks(2),labels=FALSE, tck=0.02)
		
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.65,col="grey")
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="grey")
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1.6,col='black')
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="black")		
		panLab("100 cm",mag=1)
		abline(h=Ws(L=len)/1000,lty=2)
		
		
		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',yaxt='n',las=1)
		axis(1, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(2, at=axTicks(2),labels=TRUE, tck=0.02,las=1)
		axis(3, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(4, at=axTicks(2),labels=FALSE, tck=0.02)
		
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.6,col="grey")
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="grey")
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1.6,col='black')
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="black")		
		panLab("120 cm",mag=1)
		abline(h=Ws(L=len)/1000,lty=2)
		
		# 1400 mm
		len<- 1400
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',yaxt='n',las=1)
		axis(1, at=axTicks(1),labels=TRUE, tck=0.02,cex.axis=1.6)
		axis(2, at=axTicks(2),labels=TRUE, tck=0.02,las=1)
		axis(3, at=axTicks(1),labels=FALSE, tck=0.02)
		axis(4, at=axTicks(2),labels=FALSE, tck=0.02)
		
		#segdat<-subset(pdat, length==len &basin=="LB")
		#segdat$year<- segdat$year-0.05
		#points(weight~year,segdat, type='p',pch=19,cex=1.5,col="grey")
		#segments(x0=segdat$year,y0=segdat$lci,lwd=2,
	#		x1=segdat$year,	y1=segdat$uci,col="grey")
		
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year+0.05
		points(weight~year,segdat, type='p',pch=17,cex=1.6,col='black')
		segments(x0=segdat$year,y0=segdat$lci,lwd=3,
			x1=segdat$year,	y1=segdat$uci,col="black")		
		panLab("140 cm",mag=1)
		abline(h=Ws(L=len)/1000,lty=2)
		
        mtext(side=1, "Year",outer=TRUE,cex=1.3,line=1)
        mtext(side=2, "Predicted weight, kg",outer=TRUE,cex=1.3)
        legend("bottomright", c("Lower Basin","Upper Basin","Conf. Interval"),title="Explanation",
			pch=c(19,17,NA),col=c("grey","black","black"),lty=c(NA,NA,1),lwd=3,cex=1, bty='n',ncol=2)
		}
	
	if(n==5)
		{
		pdat<- tables(4)
		kns<-tables(1)
		par(mfrow=c(3,1),mar=c(2,4,0,0),oma=c(3,3,1,5))
		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("800 mm",mag=1)
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
				plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
				panLab("1000 mm",mag=1)
		# 1200 mm
		len<- 1200
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=TRUE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="LB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="LB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("1200 mm",mag=1)

		mtext(side=2, "Expected weight, kg",outer=TRUE, line=-0.5,cex=1.3)
		mtext(side=1, "Year",outer=TRUE, line=2,cex=1.3)
		mtext(side=4, "Mean condition, unitless",outer=TRUE, cex=1.3,line=4)
		legend("topright",c("Predicted weight","Mean condition"),pch=c(19,1),bty='n',cex=1.3)
		}
	if(n==6)
		{
		pdat<- tables(4)
		kns<-tables(1)
		par(mfrow=c(4,1),mar=c(1,4,0,0),oma=c(3,1,1,1))

		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		
		# 800 mm
		len<- 800
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("800 mm",mag=1)
		
		# 1000 mm
		len<- 1000
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("1000 mm",mag=1)
        
		# 1200 mm
		len<- 1200
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("1200 mm",mag=1)
        
		# 1400 mm
		len<- 1400
		ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))*c(0.9,1.1)
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=TRUE,tck=0.02,cex.axis=1.3)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
        
		segdat<-subset(pdat, length==len &basin=="UB")
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		par(new=TRUE)
		plot(kn_mean~year, kns,subset=basin=="UB",yaxt='n',ylab="",cex=1.5,xaxt='n')
        axis(side=4,at=axTicks(2),labels=TRUE,tck=0.02,cex.axis=1.3,las=1)
		panLab("1400 mm",mag=1)
        
		mtext(side=2, "Predicted weight (kg)",outer=TRUE, line=-0.5,cex=1.3)
		mtext(side=1, "Year",outer=TRUE, line=2,cex=1.3)
		legend("bottomright",c("Predicted weight","Mean condition"),pch=c(19,1),bty='n')
		}
	

	if(n==7)
		{
		#' Why are 2016 upper basin fish heavier but kn is down?
		x<-data.frame(len=c(200:1600))
		x$llen<- log(x$len)
		fit2<-lm(lwgh~llen,lw,subset=year==2016 & basin=="UB")
		x$w<-exp(predict(fit2,x))
		x$ws<-Ws(x$len)
		x$kn<-x$w/x$ws
        
        par(mar=c(4,4,1,4))
		plot(kn~len,x,ylim=c(0.75,1.25),type='l',lwd=4,las=1,ylab="",
			xlab="",xlim=c(200,1600),xaxt='n',yaxt='n',
            xaxs = "i",yaxs = "i")
        axis(1,at=axTicks(1),labels=TRUE, tck=0.02,las=1)
        axis(2,at=axTicks(2),labels=TRUE, tck=0.02,las=1)
        axis(3,at=axTicks(1),labels=FALSE, tck=0.02,las=1)
        axis(1,at=axTicks(1),labels=TRUE, tck=0.02,las=1)
		fit3<-lm(lwgh~llen, lw, subset=basin=="UB"&
			year==2015)
		x$w15<-exp(predict(fit3,x))
		x$kn15<-x$w15/x$ws
		points(kn15~len,x,col='grey',type='l',lwd=4)	
	
		par(new=TRUE)
		plot(density(lw[which(lw$year==2015 & lw$basin=="UB"),]$length),col="grey",lty=2,
			yaxt='n',xaxt='n',ylab="",xlab="",main="",xlim=c(200,1600),ylim=c(0,0.008),
            xaxs = "i",yaxs = "i")
        axis(4,at=axTicks(2),labels=TRUE, tck=0.02,las=1)
		points(density(lw[which(lw$year==2016 & lw$basin=="UB"),]$length),col="black",lty=2,
			type='l')
		legend("top",legend=c(2015,2016),col=c("grey","black"),lwd=2,bg='white',bty='n')
        mtext(side=1, "Length, mm", line=3,cex=1.3)
        mtext(side=2, "Condition, unitless", line=3,cex=1.3)
        mtext(side=4, "Catch density, unitless", line=3,cex=1.3)
        box()
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
		x$ws<-Ws(x$len)
		x$kn<-x$w/x$ws
		par(mfrow=c(2,1),mar=c(3,1,0,0),oma=c(1,3,1,1),cex.axis=0.8)
		plot(kn~length,x,lwd=4,las=1,ylab="Condition",ylim=c(0.68,1.2),
			xlab="Length (mm)",subset=basin=="LB",type='n',
            xaxs = "i",yaxs = "i",xaxt='n',yaxt='n')
        axis(1, at=axTicks(1),labels=TRUE,tck=0.02,las=1)  
        axis(3, at=axTicks(1),labels=FALSE,tck=0.02,las=1)   
        axis(2, at=axTicks(2),labels=TRUE,tck=0.02,las=1)   
        axis(4, at=axTicks(2),labels=FALSE,tck=0.02,las=1)            
            
		xx<-levels(x$year_f)
		cols<- grey(level=c(0:length(xx))/(length(xx)+1))
		sapply(1:length(xx),function(i)
			{
			points(kn~length,x,lwd=3,subset=basin=="LB" & year_f==xx[i],type='l',
				col=cols[i])
			return(NULL)
			})
		legend("bottom",legend=c(2003:2016),col=cols,lwd=4,bg='white',ncol=4,cex=0.75,bty='n')
        box()
		panLab("Lower basin",mag=1)	

        
		plot(kn~length,x,lwd=4,las=1,ylab="Condition",ylim=c(0.6,1.3),
			xlab="Length (mm)",subset=basin=="UB",type='n',
            xaxs = "i",yaxs = "i",yaxt='n',xaxt='n')
        axis(1, at=axTicks(1),labels=TRUE,tck=0.02,las=1)  
        axis(3, at=axTicks(1),labels=FALSE,tck=0.02,las=1)   
        axis(2, at=axTicks(2),labels=TRUE,tck=0.02,las=1)   
        axis(4, at=axTicks(2),labels=FALSE,tck=0.02,las=1)   
            
		xx<-levels(x$year_f)
		cols<- grey(level=c(0:length(xx))/(length(xx)+1))
		sapply(1:length(xx),function(i)
			{
			points(kn~length,x,lwd=3,subset=basin=="UB" & year_f==xx[i],type='l',
				col=cols[i])
			return(NULL)
			})	
        box()
        
        
		mtext(side=1, "Length, mm",outer=TRUE,line=-1,cex=0.9)
		mtext(side=2, "Predicted condition, unitless",outer=TRUE,line=1.5,cex=0.9)
		panLab("Upper basin",mag=1)
		}

    if(n==9)
        {
        #` plot of mean weight for 200-1200 mm fish for 2011 to 2016 in lower basin
        
		par(mfrow=c(3,2),mar=c(1,4,0,0),oma=c(3,1,1,1))
        
        pdat<- tables(4)
		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		pdat<- subset(pdat,year>2010 & basin=="LB")

        pwcomp<-tables(5)
        pwcomp$sig<-ifelse(pwcomp$p.value<0.05/24,"Sig.dif.","No dif.")
        pwcomp$lens<-round(pwcomp$lens,-1)
	     
          	# 1000 mm
		len<- 1000
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)
                
           
       	# 1200 mm
		len<- 1200
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)
                

		# 600 mm
		len<- 600
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)
                
  		# 800 mm
		len<- 800
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)	 
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)
        
  
		# 200 mm
		len<- 200
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=TRUE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)   
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)
        
		# 400 mm
		len<- 400
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=TRUE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.3)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len,"mm",sep=" "),mag=1)     
        mtext(side=1, "Year",line=1.5, cex=1.3,outer=TRUE)
        mtext(side=2, "Predicted weight, kg",line=-0.58, cex=1.3,outer=TRUE)
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig)

        
        }
      if(n=="9ppt")
        {
        #` plot of mean weight for 200-1200 mm fish for 2011 to 2016 in lower basin
        
		par(mfrow=c(3,1),mar=c(1,3,0,0),oma=c(3,3,1,1))
        
        pdat<- tables(4)
		pdat$weight<- pdat$weight/1000
		pdat$lci<- pdat$lci/1000
		pdat$uci<- pdat$uci/1000
		pdat<- subset(pdat,year>2010 & basin=="LB")

        pwcomp<-tables(5)
        pwcomp$sig<-ifelse(pwcomp$p.value<0.05/24,"Sig.dif.","No dif.")
        pwcomp$lens<-round(pwcomp$lens,-1)
        labMag<-2
  		# 800 mm
		len<- 800
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.6)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len/10,"cm",sep=" "),mag=labMag)	 
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig,cex=2)
       
    
        # 1000 mm
		len<- 1000
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.6)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len/10,"cm",sep=" "),mag=labMag)	
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig,cex=2)
                
           
       	# 1200 mm
		len<- 1200
        ylims<-range(unlist(pdat[which(pdat$length==len),c(7,8)]))
		plot(weight~year,pdat,subset=length==len  , type='n',
			ylim=ylims,ylab="",xaxt='n',las=1,cex=1.5,yaxt='n')
		axis(1, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(3, at=axTicks(1),labels=FALSE,tck=0.02)
		axis(2, at=axTicks(2), labels=TRUE,las=1,tck=0.02,cex.axis=1.6)
 		segdat<-subset(pdat, length==len)
		segdat$year<- segdat$year-0.05
		points(weight~year,segdat, type='p',pch=19,cex=1.5)
		segments(x0=segdat$year,y0=segdat$lci,lwd=2,
			x1=segdat$year,	y1=segdat$uci)
		panLab(paste("  ",len/10,"cm",sep=" "),mag=labMag)	
        tmp<-subset(pwcomp,lens==len)
        text(tmp$x,tmp$y,tmp$sig,cex=2)
                
        mtext(side=1, "Year",outer=TRUE,cex=1.3,line=1.75)
        mtext(side=2, "Predicted weight, kg",outer=TRUE,cex=1.3,line=1.35)
        axis(1, at=axTicks(1),labels=TRUE, tck=0.02,cex.axis=1.6)

        
        }

}