# Required packages:
library(sqldf)

createPlot2 <- function() {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile = "myfile.zip" )
        unzip("myfile.zip")
        DF4 <- read.csv.sql("household_power_consumption.txt", sql = 'select * from  file where Date = "1/2/2007" or Date = "2/2/2007"',sep=';')
        DF4$"DateTime"<-strptime(paste(DF4$"Date",DF4$"Time"),"%d/%m/%Y %H:%M:%S")
        png("plot2.png",width=480, height=480,units="px")
        plot(DF4$"DateTime",DF4$"Global_active_power",ylab="Global Active Power(kilowatts)",xlab="", type = "l")
        dev.off()
}