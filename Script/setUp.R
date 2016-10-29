# Download 
Archivo <- "NEI.zip"
if(!file.exists(Archivo)){
  Archivo.URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  download.file(url = Archivo.URL, destfile = Archivo, method = "curl")
}
if(!(file.exists("summarySCC_PM25.rds") && 
     file.exists("Source_Classification_Code.rds"))){
  unzip(Archivo)
}

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Load Libraries 

library(dplyr)
library(ggplot2)
