
# Getting data
filename = "household_power_consumption.txt"
data <- read.table(filename, header=T, sep=";", stringsAsFactors=F, na.strings="?", nrows=2075259)

# Subset by dates
dataSubset <- subset(data, strptime(Date, format="%d/%m/%Y") >= strptime("2007-02-01", format="%Y-%m-%d") 
    & strptime(Date, format="%d/%m/%Y") <= strptime("2007-02-02", format="%Y-%m-%d"))

# Plot
hist(dataSubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
