

randall_removals<- read.csv("./dat/randall-deletes.csv")

com99<- odbcConnectAccess2007("./dat/dat.accdb")
eff<- sqlFetch(com99,"eff")
fish<- sqlFetch(com99,"fish")
stocked<- sqlFetch(com99,"stocked")
genetics<- sqlFetch(com99,"genetics")

# NEW DATA SENT ON 6/14/2017 BY EMAIL FROM TIM
# WELKER

new_data<- read.csv("dat/Copy of 2016_2017_pdsg_colvin.csv")


