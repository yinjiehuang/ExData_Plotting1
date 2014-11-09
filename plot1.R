## First of all, read the data into memory
## Most of the data is uncessary, we only read 01/02/2007 to 02/02/2007 data which starts from 
## line 66637 to line 69517
mydata <- mydata <- read.table("household_power_consumption.txt", header = T, skip = 66636, sep = ";", nrow = 69517 - 66637)
# Change the column name
colnames(mydata) <- c("Date","Time","Global_active_power","Glocal_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

# Save to PNG
png("plot1.png", width = 480, height = 480)

# Plot1
hist(mydata$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

# Close the device
dev.off()