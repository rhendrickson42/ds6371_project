# This file is meant to run all of the code without any of the RMD stuff
# to be used for testing and experimentation

rm(list=ls())

library(dplyr)
library(ggplot2)
library(doBy)
library(stringr)
library(reshape2)
library(gridExtra)
library(gplots)


source('code/00_Setup.R')
source('code/01_LoadData.R')
source('code/02_Prepare_Data.R')

source('code/99_Save_Data.R')
