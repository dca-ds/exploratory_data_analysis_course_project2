NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

SCC.coal = SCC[grepl("coal", SCC$Short.Name, ignore.case=TRUE), ]
coalCombustionNEI <- merge(x=NEI, y=SCC.coal, by='SCC')
coalCombustionNEI.sum <- aggregate(coalCombustionNEI[, 'Emissions'], by=list(coalCombustionNEI$year), sum)
colnames(coalCombustionNEI.sum) <- c('Year', 'Emissions')

library(ggplot2)
png(filename='./data/plot4.png')

ggplot(coalCombustionNEI.sum, aes(factor(Year), Emissions)) +
  geom_bar(stat="identity", fill="red", width=0.75) +
  labs(x="Year", y=expression("Total PM"[2.5]*" Emission (tons)")) + 
  labs(title=expression("US PM"[2.5]*" Coal Combustion Emissions (1999 - 2008)"))

dev.off()
