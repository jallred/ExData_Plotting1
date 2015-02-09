library(datasets)

# read in the data, and name the columns since we're skipping the first row (and other rows)
t<-read.table("household_power_consumption.txt", skip=66637 ,nrows=2880, sep=";")
colnames(t) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# put date/time into the Date column
t$Date <- strptime(paste(t$Date,t$Time), "%d/%m/%Y %H:%M:%S")

# png device open
png(file = "plot4.png")

# 2x2 layout
par(mfcol=c(2,2))

# top left
plot(t$Date,t$Global_active_power, type="l",ylab="Global Active Power",xlab="")

# bottom left
plot(t$Date,t$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(t$Date,t$Sub_metering_2, type="l", col="red")
lines(t$Date,t$Sub_metering_3, type="l", col="blue")
legend("topright", box.lwd=0, legend=names(data[7:9]), lty=1, col=c("black","red","blue"), cex=0.7)

# top right
plot(t$Date,t$Voltage, type="l",ylab="Voltage",xlab="datetime")

# bottom right
plot(t$Date,t$Global_reactive_power, type="l",ylab="Global_reactive_power",xlab="datetime")

# close the device
dev.off()