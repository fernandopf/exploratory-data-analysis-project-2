
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


#Merge both tables
NEISCC <- merge(NEI, SCC, by="SCC")

coal <- NEISCC[grepl("Coal|coal", NEISCC$EI.Sector ),]

sumcoal <- tapply(coal$Emissions, coal$year, sum, na.rm=TRUE)

png(filename='plot4.png', width=480, height=480, units='px')

barplot(sumcoal, xlab = "Years", ylab = "Emissions", main = "Total emissions in coal")



dev.off()


