#PLOT 1

#load data
power<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

#SUBSET
powersub <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
powersub$Global_active_power<-as.numeric(powersub$Global_active_power)
powersub$datetime <- strptime(paste(powersub$Date, powersub$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#CREATE PLOT
png("plot2.png", width=480, height=480)
plot(powersub$datetime, powersub$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
