## First of all, read the data into memory
## Most of the data is uncessary, we only read 01/02/2007 to 02/02/2007 data which starts from 
## line 66637 to line 69517
mydata <- mydata <- read.table("household_power_consumption.txt", header = T, skip = 66636, sep = ";", nrow = 69517 - 66637)
# Change the column name
colnames(mydata) <- c("Date","Time","Global_active_power","Glocal_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Plot4
# Make the time format of R
date <- paste(mydata$Date, mydata$Time, sep = ",")
rdate <- strptime(date, format = "%d/%m/%Y, %H:%M:%S")

# Save to PNG
png("plot4.png", width = 480, height = 480)

# Plot the figure
par(mfrow = c(2,2))
with(mydata, {
        plot(rdate, Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
        plot(rdate, Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
        plot(rdate, Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
        lines(rdate, Sub_metering_2, type = "l", col = "red")
        lines(rdate, Sub_metering_3, type = "l", col = "blue")
        legend("topright", lty =1 , col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(rdate, Glocal_reactive_power, xlab = "datetime" , type = "l")
})

# Close the device
dev.off()