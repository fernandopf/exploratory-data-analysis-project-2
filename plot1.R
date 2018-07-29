NEI <- readRDS("summarySCC_PM25.rds")

sumYear <- tapply(NEI$Emissions, NEI$year, sum, na.rm=TRUE)

png(filename='plot1.png')

barplot(sumYear, xlab = "Years", ylab = "Emissions", main = "Total emissions over the Years")

dev.off()




