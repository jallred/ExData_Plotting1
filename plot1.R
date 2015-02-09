library(datasets)

# read in the data, and name the columns since we're skipping the first row (and other rows)
t<-read.table("household_power_consumption.txt", skip=66637 ,nrows=2880, sep=";")
colnames(t) = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# save the histogram to a file
png(file = "plot1.png")
hist(t$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col=c("red"))
dev.off()