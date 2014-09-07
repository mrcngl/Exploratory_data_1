## Reading the data
full_dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Defining date format
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Creating data subset with the required days to analyze
data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Dates and time conversion
datestime <- paste(as.Date(data$Date), data$Time)
data$datestime <- as.POSIXct(datestime)

## Plot 1 creation
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## PNG plot creation
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()