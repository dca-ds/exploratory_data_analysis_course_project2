NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")
baltimoreData <- NEI[NEI$fips=="24510", ]

library(ggplot2)
png(filename='./data/plot3.png')
ggplot(baltimoreData, aes(factor(year), log10(Emissions))) +
  geom_boxplot(aes(fill=type)) +
  facet_grid(.~type) +
  labs(x="year", y=expression("log"[10]*" Total PM"[2.5]*" Emission by Type (tons)")) +
  labs(title=expression("Baltmore City PM"[2.5]*" Emissions by Source Type"))
dev.off()
