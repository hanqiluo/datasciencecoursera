#
# Plot 2
# Exploratory Data Analysis
# Project 1: Measurements of electric power consumption in one household with a 
# one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
#
library(lubridate)

#
# set direcotry
#
setwd("~/Desktop/github/ExploratoryDataAnalysis/project1Final")



#
# Download data
#
url<-'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
download.file(url,destfile='power_consumption.zip')
unzip('power_consumption.zip',overwrite=TRUE)

#
# read data
#
varClass <- c(rep('character',2),rep('numeric',7))
project1 <- read.table("household_power_consumption.txt", header = T, sep = ";",
                       na.strings = "?", nrows = 2075259, colClasses=varClass)


#subset the data: only include 2007-02-01 and 2007-02-02
project1 <- subset(project1, Date == "1/2/2007" | Date == "2/2/2007") 



#generate a variable with both date and time
project1$dateTime <- dmy(project1$Date) + hms(project1$Time)


#
# Save data
#
write.table(project1,
            file='~/Desktop/github/ExploratoryDataAnalysis/project1Final/household_power_consumption_clean.txt',
            sep=',', row.names=T)

#
# Plot 2: Global Active Power by dating
#
png(filename='figures/plot2.png', width = 480, height = 480, units='px')
with(project1, plot(dateTime, Global_active_power, type = "l", xlab = "", 
                    ylab = ""))
title(ylab = "Global Active Power(kilowatts)", xlab = "", cex = 0.1)
dev.off()


