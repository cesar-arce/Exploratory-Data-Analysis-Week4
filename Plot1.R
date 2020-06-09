# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

## Plot1 Data Processing
## Setting the Work Directory and Downloading EPA File From the Internet

## setwd("D:\Cesar\0JohnsHopkins\4-ExploratoryDataAnalysis\Week4\exdata_data_NEI_data")
## getwd()

## download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "FNEI_data.csv")

# Call Packages dplyr, bindrcpp & ggplot2
## install.packages("dplyr")
library(dplyr)

## install.packages("bindrcpp")
library(bindrcpp)

## install.packages("ggplot2")
library(ggplot2)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")

# reading and exploring SCC data - Source Classification Code Data
SCC <- readRDS("Source_Classification_Code.rds")


# head data
head(NEI)
##     fips      SCC Pollutant Emissions  type year
## 4  09001 10100401  PM25-PRI    15.714 POINT 1999
## 8  09001 10100404  PM25-PRI   234.178 POINT 1999
## 12 09001 10100501  PM25-PRI     0.128 POINT 1999
## 16 09001 10200401  PM25-PRI     2.036 POINT 1999
## 20 09001 10200504  PM25-PRI     0.388 POINT 1999
## 24 09001 10200602  PM25-PRI     1.490 POINT 1999

# string data
str(NEI)
## 'data.frame':    6497651 obs. of  6 variables:
##  $ fips     : chr  "09001" "09001" "09001" "09001" ...
##  $ SCC      : chr  "10100401" "10100404" "10100501" "10200401" ...
##  $ Pollutant: chr  "PM25-PRI" "PM25-PRI" "PM25-PRI" "PM25-PRI" ...
##  $ Emissions: num  15.714 234.178 0.128 2.036 0.388 ...
##  $ type     : chr  "POINT" "POINT" "POINT" "POINT" ...
##  $ year     : int  1999 1999 1999 1999 1999 1999 1999 1999 1999 1999 ...

# dimension data
dim(NEI)
## [1] 6497651       6

# head data
head(SCC)

# string data
str(SCC)

# dimension data
dim(SCC)
## [1] 11717    15

# aggregating NEI emmissions by year
yearly_emmissions <- aggregate(Emissions ~ year, NEI, sum)

# generate plot1.npg
cols <- c("maroon", "orange", "yellow", "Aquamarine")
barplot(height=yearly_emmissions$Emissions/1000, 
        names.arg=yearly_emmissions$year, 
        xlab="Year", 
        ylab=expression('Aggregated Emission'[x1000]*'PM'),
        main=expression('Aggregated PM'[2.5]*' Emmissions by Year from 1999 to 2008'), col = cols)

# generate file plot1.png
dev.copy(png, file="plot1.png", height=480)
dev.off()
