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

