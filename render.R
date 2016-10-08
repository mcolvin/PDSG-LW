
library(rmarkdown)
library(knitr)
library(pander)

setwd("C:/Users/mcolvin/Documents/projects/pallid sturgeon/analysis/PDSG-LW")
render("readme.Rmd","all",clean=FALSE)
fn<-dir()
fn<- fn[which(fn %in% c("readme.knit.md","readme.utf8.md"))]
file.remove(fn)

render('R/notebook.R', output_format="html_document")


# clean=false to keep md for github, might do my own cleanup dir()

