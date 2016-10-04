

randall_removals<- read.csv("./dat/Copy of Randall selected odd L_W from Colvin condition data.csv")

com99<- odbcConnectAccess2007("./dat/dat.accdb")
eff<- sqlFetch(com99,"eff")
fish<- sqlFetch(com99,"fish")
stocked<- sqlFetch(com99,"stocked")
genetics<- sqlFetch(com99,"genetics")
