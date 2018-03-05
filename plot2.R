## PLOT 2

## Read Data
library(data.table)
EPCdata<-fread(input = "household_power_consumption.txt", na.strings="?")

## Create datetime variable
EPCdata[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Filter Date  
EPCdata$Date<-as.Date(EPCdata$Date, format = "%d/%m/%Y")
subEPC<-EPCdata[(Date>="2007-02-01") & (Date<="2007-02-02")]

## Plot
png("plot2.png", width=480, height=480)
plot(subEPC$datetime,subEPC$Global_active_power,
     type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

