library(ggplot2)
library(lubridate)
library(dplyr)
library(tidyr)

data<-household_power_consumption

data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]
data1$Time<-strptime(data1$Time, " %H:%M:%S")
data1$Date<-as.Date(data1$Date, "%d/%m/%Y")

png("plot1.png",width=480,height=480)
hist(as.numeric(data1$Global_active_power), main = "Global Active Power",xlab="Global Active Power(kilowatts)",ylab="Frequency",col="red")
dev.off()