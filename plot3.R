# Required packages:
library(sqldf)

createPlot3 <- function() {
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, destfile = "myfile.zip" )
        unzip("myfile.zip")
        DF4 <- read.csv.sql("household_power_consumption.txt", sql = 'select * from  file where Date = "1/2/2007" or Date = "2/2/2007"',sep=';')
        DF4$"DateTime"<-strptime(paste(DF4$"Date",DF4$"Time"),"%d/%m/%Y %H:%M:%S")
        png("plot3.png",width=480, height=480,units="px")
        yrange <- range(DF4$"Sub_metering_1")
        xrange <- range(DF4$"DateTime")
        plot(xrange, yrange, ylab="Energy sub metering",xlab="", type = "n")
        lines(DF4$"DateTime",DF4$"Sub_metering_1",col="black")
        lines(DF4$"DateTime",DF4$"Sub_metering_2",col="red")
        lines(DF4$"DateTime",DF4$"Sub_metering_3",col="blue")
        legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
        dev.off()
}