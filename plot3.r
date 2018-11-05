library(ggplot2)
library(lubridate)
library(dplyr)
library(tidyr)

data<-household_power_consumption
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

data1$Sub_metering_1<-as.character(data1$Sub_metering_1)
data1$Sub_metering_2<-as.character(data1$Sub_metering_2)
data1$Sub_metering_3<-as.character(data1$Sub_metering_3)

png("plot3.png",width=480,height=480)
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2 ~ Datetime,col='Red')
  lines(Sub_metering_3 ~ Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()