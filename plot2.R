
# Getting data
filename = "household_power_consumption.txt"
data <- read.table(filename,header = T, sep=";",stringsAsFactors = F, na.strings="?", nrows=2075259)

# Subset by dates
dataSubset <- subset(data, strptime(Date, format="%d/%m/%Y") >= strptime("2007-02-01", format="%Y-%m-%d") 
                     & strptime(Date, format="%d/%m/%Y") <= strptime("2007-02-02", format="%Y-%m-%d"))

dateTime <- paste(as.Date(dataSubset$Date, "%d/%m/%Y"), dataSubset$Time)
dataSubset$Datetime <- as.POSIXct(dateTime)

# Plot
png(filename = "plot2.png", width = 480, height = 480)
plot(dataSubset$Global_active_power~dataSubset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.off()
