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

# BE SURE TO CHANGE THE DRAFT FOLDER TO INTERATE
# FIGURE DRAFTS.

dev.new(height=8.5,width=11)
figures(1,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-01.pdf",
    type="pdf")
dev.off()   

    
dev.new(height=10,width=10)
figures(2,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-02.pdf",
    type="pdf")
dev.off()  


dev.new(height=8.5,width=11)
figures(3,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-03.pdf",
    type="pdf")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-14.pdf",
    type="pdf")    
    
dev.off()     

  
dev.new(height=8.5,width=11)
figures(4,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-04.pdf",
    type="pdf")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-15.pdf",
    type="pdf")
dev.off()  


dev.new(height=10,width=10)
figures(5,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-05.pdf",
    type="pdf")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-16.pdf",
    type="pdf")   
dev.off()  

dev.new(height=10,width=10)
figures(6,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-06.pdf",
    type="pdf")
 dev.off()  
dev.new(height=10,width=10)
figures(7,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-07.pdf",
    type="pdf")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-17.pdf",
    type="pdf")   
dev.off()  
    dev.new(height=10,width=10)
figures(8,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-08.pdf",
    type="pdf")
  dev.off()     
    dev.new(height=10,width=10)
figures(9,form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-09.pdf",
    type="pdf")
 dev.off()  

dev.new(height=8.5,width=11)
figures("9ppt",form="USGS")
savePlot("C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-03/figure-09ppt.pdf",
    type="pdf")
 dev.off()     
    
write.csv(tables(2),"C:/Users/mcolvin/Documents/projects/Pallid Sturgeon/Analysis/PDSG-LW/Drafts/Draft-01/model-selection.csv")