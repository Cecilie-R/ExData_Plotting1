#PLOT 1

#load data
power<-read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#SUBSET
powersub <- power[power$Date %in% c("1/2/2007","2/2/2007") ,]
GAP<-as.numeric(powersub$Global_active_power)

#CREATE PLOT
png("plot1.png", width=480, height=480)
hist(GAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylim=c(0,1200))
dev.off()
