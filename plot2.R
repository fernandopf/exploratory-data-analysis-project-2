fichero_name <- "household_power_consumption.txt"

consumption <- read.table(fichero_name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

goodConsumption <- consumption[ grepl("^1/2/2007|^2/2/2007", consumption[,1]),]

datetime <- strptime(paste(goodConsumption$Date, goodConsumption$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(datetime, goodConsumption$Global_active_power,type = "l" , xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

