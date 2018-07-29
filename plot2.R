NEI <- readRDS("summarySCC_PM25.rds")


Baltimore <- subset(NEI, fips=="24510")
sumYearBaltimore <- tapply(Baltimore$Emissions, Baltimore$year, sum, na.rm=TRUE)


png(filename='plot2.png')

barplot(sumYearBaltimore, xlab = "Years", ylab = "Emissions", main = "Total emissions over the Years in Baltimore City")

dev.off()




