
# Getting data
filename = "household_power_consumption.txt"
data <- read.table(filename,header = T, sep=";",stringsAsFactors = F, na.strings="?", nrows=2075259)

# Subset by dates
dataSubset <- subset(data, strptime(Date, format="%d/%m/%Y") >= strptime("2007-02-01", format="%Y-%m-%d") 
                     & strptime(Date, format="%d/%m/%Y") <= strptime("2007-02-02", format="%Y-%m-%d"))

dateTime <- paste(as.Date(dataSubset$Date, "%d/%m/%Y"), dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(dateTime)

# Plot
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
with(dataSubset, {
  plot(dataSubset$Global_active_power~dataSubset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(dataSubset$Voltage~dataSubset$Datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(dataSubset$Global_reactive_power~dataSubset$Datetime, type="l", ylab="Global_reactive_power", xlab="datetime")
  
})

dev.off()