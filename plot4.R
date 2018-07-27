fichero_name <- "household_power_consumption.txt"

consumption <- read.table(fichero_name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

goodConsumption <- consumption[ grepl("^1/2/2007|^2/2/2007", consumption[,1]),]

datetime <- strptime(paste(goodConsumption$Date, goodConsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 
# First plot
plot(datetime, goodConsumption$Global_active_power,type = "l" , xlab="", ylab="Global Active Power (kilowatts)")

plot(datetime, goodConsumption$Voltage,type = "l" , xlab="", ylab="Voltage")

# Third plot
plot(datetime, goodConsumption$Sub_metering_1,type = "l" , col="black",ylab="Energy sub metering")
lines(datetime, goodConsumption$Sub_metering_2, type="l", col="red")
lines(datetime, goodConsumption$Sub_metering_3, type="l", col="blue")

# Fourth Plot
plot(datetime, goodConsumption$Global_reactive_power,type = "l" , xlab="", ylab="Global Reactive Power (kilowatts)")

dev.off()
