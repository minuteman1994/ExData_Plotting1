## Setting Directory
getwd()
setwd("C:/Users/root/Documents/coursera/exploratory_data_analysis/work")

## Getting full dataset
data <- read.csv("../data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
tinydata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(tinydata$Date), tinydata$Time)
tinydata$Datetime <- as.POSIXct(datetime)

## Creating Plot 1
hist(tinydata$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()