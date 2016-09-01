# plot1() creates first plot in Course Project 1.Exploratory Analysis
# plot is shown on the screan

plot1 <- function(if_get_and_select=TRUE, if_write_png_file=FALSE, data_url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip")
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

# if (if_write_png_file = TRUE), function write plot to png file
if (if_write_png_file) 
        {
            png("./plot1.png")
            hist(data2$Global_active_power, col="red", xlab="Global Active Powers (kilowatts)", ylab="Frequency",main="Global active power")

            dev.off()
        }  
  
dev.new()
gap_histogram <- hist(data2$Global_active_power, col="red", xlab="Global Active Powers (kilowatts)", ylab="Frequency",main="Global active power")
print(gap_histogram)


}