NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

totalEmissions1999 <- sum(NEI$Emissions[NEI$year==1999])
totalEmissions2002 <- sum(NEI$Emissions[NEI$year==2002])
totalEmissions2005 <- sum(NEI$Emissions[NEI$year==2005])
totalEmissions2008 <- sum(NEI$Emissions[NEI$year==2008])
xs <- c(1999,2002,2005,2008)
ys <- c(totalEmissions1999, totalEmissions2002, totalEmissions2005, totalEmissions2008)

png('./data/plot1.png')

barplot(ys, col='red', names.arg=xs, xlab='Year',ylab='Total Emissions (tons)')
title(main='US Total PM2.5 Emissions')

dev.off()
