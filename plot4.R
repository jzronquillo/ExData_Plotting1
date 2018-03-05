## PLOT 4

## Read Data
library(data.table)
EPCdata<-fread(input = "household_power_consumption.txt", na.strings="?")

## Create datetime variable
EPCdata[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]

## Filter Date  
EPCdata$Date<-as.Date(EPCdata$Date, format = "%d/%m/%Y")
subEPC<-EPCdata[(Date>="2007-02-01") & (Date<="2007-02-02")]

## Plot
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2),mar=c(4.5,4.5,2,2))

## plot1
plot(subEPC$datetime,subEPC$Global_active_power,type="l",
     ylab="Global Active Power",xlab="")

## plot2
plot(subEPC$datetime,subEPC$Voltage,type="l",
     ylab="Voltage",xlab="datetime")

## plot3
plot(subEPC$datetime,subEPC$Sub_metering_1,type="l",ylab = "Energy sub metering",xlab = "")
lines(subEPC$datetime,subEPC$Sub_metering_2,col="red")
lines(subEPC$datetime,subEPC$Sub_metering_3,col="blue")
legend("topright", col =c("black","red","blue"),
       , c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
       , lty = c(1,1,1), bty = "n", cex=.8)

## plot4
plot(subEPC$datetime,subEPC$Global_reactive_power,type="l",
     ylab="Global_reactive_power",xlab="datetime")


dev.off()