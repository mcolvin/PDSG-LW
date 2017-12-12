
names(eff)<-tolower(names(eff))
names(fish)<-tolower(names(fish))
names(stocked)<-tolower(names(stocked))
names(genetics)<- tolower(names(genetics))

genetics[genetics==""]<-NA
genetics$pittag_1<- toupper(genetics$pittag_1)
genetics$pittag_2<- toupper(genetics$pittag_2)
stocked$pit_tag<- toupper(stocked$pit_tag)
stocked$pit_tag_2<- toupper(stocked$pit_tag_2)
fish$tagnumber<- toupper(fish$tagnumber)




# CLEAN AND MANIPULATE
tmp<- merge(eff,fish[,-match(c("segment_id","year"),names(fish))],
    by.x="uniqueidentifier",by.y="uniqueid")

# SUBSET OUT FISH THAT ARE OUTLIERS 
tmp<-subset(tmp, !is.na(length))
tmp<-subset(tmp, !is.na(weight))
tmp<- subset(tmp, length>0)
tmp<- subset(tmp, weight>0)
tmp<-subset(tmp,species=="PDSG")
tmp$llength<-log(tmp$length)
tmp$lweight<-log(tmp$weight)
fit<-lm(lweight~llength,tmp)
tmp$pred<- exp(fitted(fit))
tmp$residual<- resid(fit)
tmp<- subset(tmp, residual> -1.5)
tmp<- subset(tmp, residual< 1.5)
tmp<- subset(tmp, length>=200)
# DROP ANY ADDITIONAL OBSERVATIONS THAT MIKE RANDALL IDENTIFIED
tmp<- tmp[-(which(tmp$f_id %in% randall_removals$f_id)),]
tmp2<-tmp

## FORMAT STOCKING DATA
stocked<- subset(stocked, !(is.na(hatchery)))
stocked<- subset(stocked,!(is.na(stocked$pit_tag)))
stocked<- subset(stocked,!(pit_tag==""))
stocked<-  subset(stocked,!(pit_tag==".........."))
stocked<- subset(stocked,!(stocked$pit_tag=="?"))
stocked<- subset(stocked,!(duplicated(stocked$pit_tag)))
stocked$origin<- "Hatchery"

## MERGE STOCKING/HATHCHERY DATA WITH PSPAP DATA
hatchery2<- merge(tmp2,stocked, 
    by.x="tagnumber",by.y="pit_tag",all.x=TRUE)
hatchery2$hatchery<- as.character(hatchery2$hatchery)

### ASSIGN HATCHERY ORIGIN
hatchery2[which(is.na(hatchery2$origin) & 
	(hatchery2$cwtyn %in%c("Y")|#"N"
	hatchery2$dangler %in%c("Y")|#"N"
	hatchery2$scuteloc%in%c("L","R","D")|#"N"
	hatchery2$scutenum%in%c(6,3,5,4,2,7,8)|
	hatchery2$elhv%in%c("V","H","X")|
	hatchery2$elcolor%in%c("P","R","Y","G","O","U","B","K","X","V")|#"N"
	hatchery2$erhv %in%c("V","H","X")|
	hatchery2$ercolor %in% c("Y","R","P","V","O","U","G","K","W","X","B")))#"N"
	,]$origin<-"Hatchery"
	
### ASSIGN HATHCERY ORIGIN TO FISH THAT WERE IDENTIFIED AS HATHCERY FROM GENETICS
hatchery2[which(hatchery2$tagnumber%in% genetics$pittag_1),]$origin<- "Hatchery"
hatchery2[which(hatchery2$tagnumber%in% genetics$pittag_1 & is.na(hatchery2$hatchery)),]$hatchery<- "KNOWN"

### ASSIGN NATURAL ORIGIN TO LEFTOVERS
hatchery2[which(is.na(hatchery2$origin)),]$origin<- "Natural"
### SPECIFY UNKNOWN HATCHERY FOR FISH THAT DID NOT ASSIGN A HATCHERY	
hatchery2[which(is.na(hatchery2$hatchery) & hatchery2$origin=="Hatchery"),]$hatchery<-"UNKNOWN"
### PRESUMABLY NATURAL ORIGIN FISH HAVE NO HATCHERY
hatchery2[which(hatchery2$origin=="Natural"),]$hatchery<-"NONE/NATURAL"

# FORMAT UP FOR ANALYSIS FOR MIKE RANDALL FOR KN ANALYSIS
hatchery2$common_name<-"Pallid sturgeon"
hatchery2$species<-"PDSG"
fields<-c('tagnumber',
	#'mr_id',
	'f_id',		
	'segment_id','bend','basin',
	#'upper_river_mile',
	'startlatitude',
	'startlongitude','year','setdate',
	'species','common_name',
	'length.x','weight.x','kn',
	'hatchery','origin')
indx<-match(fields,names(hatchery2))
out<- hatchery2[,indx]
indx<-match(c('length.x','weight.x'),names(out))	
names(out)[indx]<-c("length","weight")
out$llen<- log(out$length)
out$lwgh<- log(out$weight)
out$segment_id<-as.factor(out$segment_id)
out$year_f<-as.factor(out$year)
out$jday<-as.numeric(format(out$setdate,"%j"))

# RECALCULATE KN USING RANDALL'S MODIFIED KN
# WRITE OVER SHUMAN'S KN 
out$kn<- out$weight/(10^(-5.9205 + 3.1574*log10(out$length)))

# ADD THE NEW DATA FROM TIM FOR 2016 AND 2017
## FIRST CHECK TO MAKE SURE NOTHING IS DUPLICATED
#names(new_data)<- tolower(names(new_data))
#new_data$llen<- log(new_data$length)
#new_data$lwgh<- log(new_data$weight)
#new_data$segment_id<-as.factor(new_data$segment_id)
#new_data$year_f<-as.factor(new_data$year)

#basins<- aggregate(kn~segment_id+basin,out,length)[,-3]
#new_data<- merge(new_data, basins, by="segment_id", all.x=TRUE)
# RECALCULATE KN USING RANDALL'S MODIFIED KN
# WRITE OVER SHUMAN'S KN 
#new_data$kn<- new_data$weight/(10^(-5.9205 + 3.1574*log10(new_data$length)))

## SUBSET OUT ALREADY EXISTING RECORDS BEFORE 
## APPENDING TO THE DATA
#new_data<- new_data[which((new_data$f_id %in% out$f_id)==FALSE),]

#out<- rbind.fill(out,new_data)

dat<- list(Kn=out)






# FORMAT DATA FOR GROWTH
growth<- merge(eff,fish,by.x="uniqueidentifier",by.y="uniqueid")
growth<-merge(growth,stocked, by.x="tagnumber",by.y="pit_tag",all.x=TRUE)
### ASSIGN HATCHERY ORIGIN
growth[which(is.na(growth$origin) & 
	(growth$cwtyn %in%c("Y")|#"N"
	growth$dangler %in%c("Y")|#"N"
	growth$scuteloc%in%c("L","R","D")|#"N"
	growth$scutenum%in%c(6,3,5,4,2,7,8)|
	growth$elhv%in%c("V","H","X")|
	growth$elcolor%in%c("P","R","Y","G","O","U","B","K","X","V")|#"N"
	growth$erhv %in%c("V","H","X")|
	growth$ercolor %in% c("Y","R","P","V","O","U","G","K","W","X","B")))#"N"
	,]$origin<-"Hatchery"
	
### ASSIGN HATHCERY ORIGIN TO FISH THAT WERE IDENTIFIED AS HATHCERY FROM GENETICS
growth[which(growth$tagnumber%in% genetics$pittag_1),]$origin<- "Hatchery"
# growth[which(growth$tagnumber%in% genetics$pittag_1 & is.na(growth$hatchery)),]$hatchery<- "KNOWN"


### ASSIGN NATURAL ORIGIN TO LEFTOVERS
growth[which(is.na(growth$origin)),]$origin<- "Natural"
### SPECIFY UNKNOWN HATCHERY FOR FISH THAT DID NOT ASSIGN A HATCHERY
growth$hatchery<- as.character(growth$hatchery)	
growth[which(is.na(growth$hatchery) & growth$origin=="Hatchery"),]$hatchery<-"UNKNOWN"
### PRESUMABLY NATURAL ORIGIN FISH HAVE NO HATCHERY
growth[which(growth$origin=="Natural"),]$hatchery<-"NONE/NATURAL"

### FIELDS FOR REACPTURE PALLIDS
flds<-c(
	"rpma",
	"startlatitude",
	"startlongitude",
	"hatchery",
	"setdate",          
	"weight.x",
	"length.x",
	"origin",
	"tagnumber")
indx<-match(flds,names(growth))
growth<- growth[,indx]
names(growth)[c(2,3,5:7)]<- c("latitude","longitude","date","weight","length")
### FIELD FOR STOCKED PALLIDS
flds<-c("rpma",
	"latitude",
	"longitude",
	"hatchery",
	"stock_date",
	"weight",
	"length",      
	"origin",
	"pit_tag")

growth_app<- stocked[!(is.na(stocked$length)),]
indx<-match(flds,names(growth_app))
growth_app<- growth_app[,indx]
names(growth_app)[5]<-"date"	
names(growth_app)[9]<-"tagnumber"	
growth_app$date<- as.Date(as.character(growth_app$date),"%m/%d/%Y")
growth<- rbind(growth,growth_app)

# assign numeric consecutive fish id

# assign capture number
growth$tmp<- 1
growth<- subset(growth, !is.na(length))
growth<- subset(growth, !is.na(tagnumber))
growth<- subset(growth, !(tagnumber==""))
growth<- subset(growth, !(tagnumber==0))
growth<- subset(growth, !(tagnumber=="nofishscan"))
growth<- subset(growth, !(is.na(rpma)))
growth<- subset(growth, !(is.na(date)))
#growth$date2<- growth$date
#growth[is.na(growth$date2),]$date2<- as.Date(growth[is.na(growth$date2),]$date, "%d-%b-%y")
#growth$date<- growth$date2
growth$year<- format(growth$date, "%Y")

tags<- aggregate(tmp~tagnumber,growth,sum)
tags<- subset(tags, tmp>1)
tags<- tags[order(tags$tagnumber),]
tags$fishIndx<- c(1:nrow(tags))
capOrder<- unlist(lapply(tags$tmp, function(x) {1:x}))

growth<- subset(growth, tagnumber %in% tags$tagnumber)
growth<- growth[order(growth$tagnumber, growth$date),]	
# ASSIGN CAPTURE ORDER
growth$nCaptures<- unlist(lapply(tags$tmp, function(x)
	{rep(x,x)}))
growth$capOrder<- unlist(lapply(tags$tmp, function(x) {1:x}))
growth$fishIndx<- unlist(lapply(tags$fishIndx, function(x)
	{rep(x,tags$tmp[x])}))
growth$rpmaIndx<- growth$rpma-1 # index for jags
growth$dT<- c(0,diff(growth$date))
growth[which(growth$capOrder==1),]$dT<-0

yy<-unique(growth$capOrder)
indx<-match(c("fishIndx","length","weight","date"),names(growth))
out<- data.frame()
for(i in 2:length(yy))
	{
	tmp<- merge(growth[growth$capOrder==yy[i-1],],
		growth[growth$capOrder==yy[i],indx],by=c("fishIndx"))
	out<- rbind(out,tmp)
	}
out<- out[order(out$fishIndx,out$capOrder),]
out$dT<- as.numeric((out$date.y-out$date.x))/365 # dT in years
out<-subset(out, rpma!=3)
out$rpmaIndx<- ifelse(out$rpma==2,1,2)
dat$growth<- out




saveRDS(dat,"./dat/dat.RDS")
