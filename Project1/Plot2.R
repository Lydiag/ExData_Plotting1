dataFile <- "./data/household_power_consumption.txt"
dataset <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]
rm(dataset)


datetimepaste<-paste(subSetData$Date, subSetData$Time, sep=" ")
dateTime <- strptime(datetimepaste, "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(dateTime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()