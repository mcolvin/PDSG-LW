

randall_removals<- read.csv("./dat/randall-deletes.csv")

com99<- odbcConnectAccess2007("./dat/dat.accdb")
eff<- sqlFetch(com99,"eff")
fish<- sqlFetch(com99,"fish")
stocked<- sqlFetch(com99,"stocked")
genetics<- sqlFetch(com99,"genetics")
