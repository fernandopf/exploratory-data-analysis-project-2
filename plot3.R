fichero_name <- "household_power_consumption.txt"

consumption <- read.table(fichero_name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

goodConsumption <- consumption[ grepl("^1/2/2007|^2/2/2007", consumption[,1]),]

datetime <- strptime(paste(goodConsumption$Date, goodConsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)

plot(datetime, goodConsumption$Sub_metering_1,type = "l" , col="black",ylab="Energy sub metering")
lines(datetime, goodConsumption$Sub_metering_2, type="l", col="red")
lines(datetime, goodConsumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2,col = c("black", "red", "blue"))

dev.off()

