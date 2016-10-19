lw<- subset(dat$Kn,segment_id%in%c(1:14))
lw$jdaysq<- lw$jday*lw$jday


fit01<- lm(lwgh~llen,lw)
fit02<- lm(lwgh~llen+basin,lw)
fit03<- lm(lwgh~llen*basin,lw)
fit04<- lm(lwgh~llen+year_f,lw)
fit05<- lm(lwgh~llen*year_f,lw)
fit06<- lm(lwgh~llen+year_f+basin,lw)
fit07<- lm(lwgh~llen+year_f*basin,lw)
fit08<- lm(lwgh~year_f+llen*basin,lw)
fit09<- lm(lwgh~llen*year_f+basin,lw)
fit<- lm(lwgh~llen*year_f*basin,lw)


# POST HOC TEST 

x11v12<- rep(0,56)
x11v12[10:11]<-c(1,-1)
names(x11v12)<-names(coef(fit))
x11v12<- matrix(x11v12,1)
tt <- glht(fit, linfct = x11v12)
summary(tt)

contr<-expand.grid(basin=c("LB","UB"),
	year_f=levels(lw$year_f))
contr$contr<-0
contr$contr[which(contr$year_f==2011 & 
	contr$basin=="LB")]<-1
contr$contr[which(contr$year_f==2011 & 
	contr$basin=="LB")]<--1	


yy<-cld(lsmeans(fit, ~ year_f |llen +basin, 
	at = list(llen = log(800),
	basin="LB",
	year_f=factor(c(2011:2016),levels(lw$year_f))
	)))
	
	
pdat<-data.frame(basin=c("LB"),
	year_f=levels(lw$year_f),llen=log(800))
predict(fit,pdat)
baci_pval<- contrast(yy, 
	list(x11v12=contr$contr))
yy<- confint(baci_pval)	
	
# EXTRACT P VALUE OF INTERACTION 	
yy <- lsmeans(fit, ~SiteClass:Period)
baci_pval<- contrast(yy, 
	list(baci=c(-1,1,1,-1)))
yy<- confint(baci_pval)