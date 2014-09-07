## Reading the data
full_dataset <- read.csv("./Data/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
## Defining date format
full_dataset$Date <- as.Date(full_dataset$Date, format="%d/%m/%Y")

## Creating data subset with the required days to analyze
data <- subset(full_dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full_dataset)

## Dates and time conversion
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 2 creation
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## PNG plot creation
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()