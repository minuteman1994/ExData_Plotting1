## Setting Directory
getwd()
setwd("C:/Users/root/Documents/coursera/exploratory_data_analysis")

## Getting full dataset
data <- read.csv("./data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
tinydata <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(tinydata$Date), tinydata$Time)
tinydata$Datetime <- as.POSIXct(datetime)

## Creating Plot 3
with(tinydata, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
               }
     )
legend("topright", col=c("black", "red", "blue"), lwd=1, cex=0.7,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()