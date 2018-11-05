library(ggplot2)
library(lubridate)
library(dplyr)
library(tidyr)

data<-household_power_consumption
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-data[data$Date == "2007-02-02" | data$Date == "2007-02-01", ]

datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

globalActivePower <- as.numeric(data1$Global_active_power)
png("plot2.png", width=480, height=480)
plot(data1$Datetime,globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()