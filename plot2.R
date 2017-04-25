NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

baltimoreEmissions1999 <- sum(NEI$Emissions[NEI$year==1999 & NEI$fips=="24510"])
baltimoreEmissions2002 <- sum(NEI$Emissions[NEI$year==2002 & NEI$fips=="24510"])
baltimoreEmissions2005 <- sum(NEI$Emissions[NEI$year==2005 & NEI$fips=="24510"])
baltimoreEmissions2008 <- sum(NEI$Emissions[NEI$year==2008 & NEI$fips=="24510"])

xs <- c(1999,2002,2005,2008)
ys <- c(baltimoreEmissions1999, baltimoreEmissions2002, baltimoreEmissions2005, baltimoreEmissions2008)

png('./data/plot2.png')

barplot(ys,col='blue',names.arg=xs,xlab='Year',ylab='Total Emissions (tons)')
title(main='Total Baltimore City PM2.5 Emissions vs Year')

dev.off()
