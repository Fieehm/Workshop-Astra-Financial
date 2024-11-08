rm(list=ls())
gc()

library(dplyr)
library(tidyr)
library(parallel)

n_core = detectCores()

setwd("~/Workshop-Astra-Financial/Raw Data")

files = list.files()

hapus = function(input){
  df = read.csv(input) |> select(-X,-nama_pelanggan)
  write.csv(df,input,row.names = F)
}

mcmapply(hapus,files)