dataFile <- "household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataset)

datetimepaste<-paste(subSetData$Date, subSetData$Time, sep=" ")
dateTime <- strptime(datetimepaste, "%d/%m/%Y %H:%M:%S") 

subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()