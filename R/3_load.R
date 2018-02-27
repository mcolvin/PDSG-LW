

randall_removals<- read.csv("dat/randall-deletes.csv")
com99<- odbcConnectAccess2007("dat/dat.accdb")
com999<- odbcConnectAccess("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/Data/20171103-pallid-dbase.mdb")

eff<- sqlFetch(com999,"EFFORT")
fish<- sqlFetch(com999,"FISH_CONDITION")
stocked<- sqlFetch(com99,"stocked")
genetics<- sqlFetch(com99,"genetics")

# NEW DATA SENT ON 6/14/2017 BY EMAIL FROM TIM
# WELKER
#20171027-added data to dbase along with most recent dat from Coral
# new_data<- read.csv("dat/Copy of 2016_2017_pdsg_colvin.csv")

