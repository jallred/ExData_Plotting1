library(datasets)

# read in the data, and name the columns since we're skipping the first row (and other rows)
t<-read.table("household_power_consumption.txt", skip=66637 ,nrows=2880, sep=";")
colnames(t) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# put date/time into the Date column
t$Date <- strptime(paste(t$Date,t$Time), "%d/%m/%Y %H:%M:%S")

# save the plot to a file
png(file = "plot3.png")
plot(t$Date,t$Sub_metering_1, type="l",ylab="Energy sub metering",xlab="")
lines(t$Date,t$Sub_metering_2, type="l", col="red")
lines(t$Date,t$Sub_metering_3, type="l", col="blue")
legend("topright", legend=names(t[7:9]), lty=1, col=c("black","red","blue"))
dev.off()