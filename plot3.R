

library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Baltimore City flips is equal to 24520
Baltimore <- subset(NEI, fips=="24510")
library(dplyr)


Baltimore_Em <- summarize(group_by(subset(NEI, fips=="24510"),type,year),sum(Emissions))
names(Baltimore_Em) <- c("type", "year", "Emissions")
png(filename='plot3.png')


qplot(year, data=Baltimore_Em, facets = .~type, fill = year, geom ="bar",
weight=Emissions, main='Baltimore City emissions per year and type', xlab='', ylab = 'Emissions (PM 2.5)')




dev.off()


