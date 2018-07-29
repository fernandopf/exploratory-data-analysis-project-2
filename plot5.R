
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge both tables
NEISCC <- merge(NEI, SCC, by="SCC")

# Select Vehicles 
vehicle <- NEISCC[grepl("Vehicle|vehicle", NEISCC$SCC.Level.Two ),]

# Choose Baltimore City
BaltimoreVehicle <- subset(vehicle, fips=="24510" )
sumYearBaltimore <- tapply(BaltimoreVehicle$Emissions, BaltimoreVehicle$year, sum, na.rm=TRUE)


png(filename='plot5.png')

barplot(sumYearBaltimore, xlab = "Years", ylab = "Emissions", main = "Total emissions in vehicles over the Years in Baltimore City")

dev.off()
