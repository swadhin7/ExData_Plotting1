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

data1$Global_active_power<-as.character(data1$Global_active_power)
data1$Voltage<-as.character(data1$Voltage)
data1$Global_reactive_power<-as.character(data1$Global_reactive_power)

png("plot4.png",width=480,height = 480)
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data1, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()