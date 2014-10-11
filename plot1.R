# Required packages:
library(sqldf)

createPlot1 <- function() {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile = "myfile.zip" )
        unzip("myfile.zip")
        DF4 <- read.csv.sql("household_power_consumption.txt", sql = 'select * from  file where Date = "1/2/2007" or Date = "2/2/2007"',sep=';')
        png("plot1.png",width=480, height=480,units="px")
        hist(DF4[,3], col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
        dev.off()

}