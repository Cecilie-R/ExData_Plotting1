#PLOT 1

#load data
power<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#SUBSET
powersub <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
powersub$Global_active_power<-as.numeric(powersub$Global_active_power)
powersub$Voltage<-as.numeric(powersub$Voltage)
powersub$Global_reactive_power<-as.numeric(powersub$Global_reactive_power)
powersub$datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#CREATE PLOT
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(powersub$datetime, powersub$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
plot(powersub$datetime, powersub$Voltage, type = "l", ylab="Voltage", xlab="datetime")
plot(powersub$datetime, powersub$Sub_metering_1, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
points(powersub$datetime, powersub$Sub_metering_2, type = "l", xlab="", ylab="Global Active Power (kilowatts)", col="red")
points(powersub$datetime, powersub$Sub_metering_3, type = "l", xlab="", ylab="Global Active Power (kilowatts)", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=c(1,1,1), legend=c("sub_metering_1", "sub_metering_2", "sub_metering_3"))
plot(powersub$datetime, powersub$Global_reactive_power, type = "l",ylab="Global_reactive_power", xlab="datetime")
dev.off()
