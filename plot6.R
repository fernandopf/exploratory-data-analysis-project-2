
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge both tables
NEISCC <- merge(NEI, SCC, by="SCC")

# Select Vehicles 
vehicle <- NEISCC[grepl("Vehicle|vehicle", NEISCC$SCC.Level.Two ),]

# Choose Baltimore City
LosAngelesVehicle <- subset(vehicle, fips=="06037" )
BaltimoreVehicle <- subset(vehicle, fips=="24510" )
LosAngelesVehicle$fips <- "Los Angeles"
BaltimoreVehicle$fips <- "Baltimore City"


todo <- rbind(LosAngelesVehicle,BaltimoreVehicle)

png(filename='plot6.png')

qplot(year, data=todo, facets = .~fips, geom ="histogram", col = year, bins =12,
      weight=Emissions, main='Baltimore City vs Los Angeles', xlab='', ylab = 'Emissions (PM 2.5)')

dev.off()
