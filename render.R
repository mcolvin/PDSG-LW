
library(rmarkdown)
library(knitr)
library(pander)

setwd("C:/Users/mcolvin/Documents/projects/pallid sturgeon/analysis/skinny-fish")
render("readme.Rmd","all",clean=FALSE)



# clean=false to keep md for github, might do my own cleanup dir()

