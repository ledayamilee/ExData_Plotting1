## Loading the data
data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                 nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')


data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
data1 <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates to correct format
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)

## Made plot 1
plot(data1$Global_active_power~data1$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Saving to file as png format
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
