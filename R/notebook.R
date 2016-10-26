#'---
#'title: "My Notebook"
#'output: html_document
#'---



setwd("C:/Users/mcolvin/Documents/projects/pallid sturgeon/analysis/PDSG-LW")

source("./R/1_global.R")
source("./R/2_functions.R")
source("./R/3_load.R")
source("./R/4_clean.R")
source("./R/5_figures.R")
source("./R/6_tables.R")
source("./R/7_analysis.R")

lll<- subset(lw, kn>0.3)
tmp<- ddply(lll,.(year,basin), summarize,
	mean=mean(na.omit(kn)),
	med=median(na.omit(kn)),
	min=min(na.omit(kn)),
	max=max(na.omit(kn)))
plot(tmp$med)

	
hist(lll$kn[which(lll$basin=="UB"&lll$year==2016)])
hist(lll$length[which(lll$basin=="UB"&lll$year==2016)])
hist(lll$length[which(lll$basin=="UB"&lll$year==2015)])
mean(lll$kn[which(lll$basin=="UB"&lll$year==2016)])

dev.new(height=10,width=10)
figures(1,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-01/figure-01.pdf",
    type="pdf")
    
    
dev.new(height=10,width=10)
figures(2,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-01/figure-02.pdf",
    type="pdf")

dev.new(height=10,width=10)
figures(3,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-01/figure-03.pdf",
    type="pdf")
    
dev.new(height=10,width=10)
figures(4,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-01/figure-04.pdf",
    type="pdf")

figures(4)
figures(5)
figures(6)
figures(7)
figures(8)


tables(1)