# plot3() creates third plot in Course Project 1.Exploratory Analysis
# plot is shown on the screan


plot3 <- function(if_get_and_select=FALSE, if_write_png_file=FALSE, data_url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
{
  # when we use data the first time, argument (if_get_and_select = TRUE), 
  # and all data is downloaded and needed dates selected.
  # prepared dataframe is stored in variable data2 to be used for other plots
  
  
      if (if_get_and_select)
        {
            download.file(data_url,"./data.zip")
            unzip("./data.zip")
            data1 <- read.csv("./household_power_consumption.txt",sep=";", dec=".",stringsAsFactors = FALSE,na.strings="?")

            library(dplyr)
            library(lubridate)

            data1<-mutate(data1,Date=dmy(Date))

            data2<-filter(data1, Date>="2007-02-01" & Date<="2007-02-02")
            data2<<-data2

        }

  
data3<-mutate(data2,Date_Time=as.POSIXct(paste(data2$Date, data2$Time), format="%Y-%m-%d %H:%M:%S"))


# if (if_write_png_file = TRUE), function write plot to png file plot3.png
if (if_write_png_file) 
        {
            png("./plot3.png")
  plot(data3$Date_Time,data3$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
  lines(data3$Date_Time,data3$Sub_metering_2,col="red")
  lines(data3$Date_Time,data3$Sub_metering_3,col="blue")
  legend("topright", names(data3)[7:9], lty=1, col=c("black", "red","blue"),bty="o",box.lty = 1, cex=1)
  dev.off()
        }  
  
dev.new()

plot3 <- plot(data3$Date_Time,data3$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(data3$Date_Time,data3$Sub_metering_2,col="red")
lines(data3$Date_Time,data3$Sub_metering_3,col="blue")
legend("topright", names(data3)[7:9], lty=1, col=c("black", "red","blue"),bty="o",box.lty = 1, cex=1)


print(plot3)


}