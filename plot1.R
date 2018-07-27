fichero_name <- "household_power_consumption.txt"

consumption <- read.table(fichero_name, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

subSetData <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

goodConsumption <- consumption[ grepl("^1/2/2007|^2/2/2007", consumption[,1]),]

png("plot1.png", width=480, height=480)
hist(as.numeric(goodConsumption$Global_active_power), col = "red", xlab = "Global Active Power (Kilovats)", main="Global Active Power")
dev.off()