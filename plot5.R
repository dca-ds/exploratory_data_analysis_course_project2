NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
vehiclesSCC <- SCC[vehicles, ]$SCC
vehiclesNEI <- NEI[NEI$SCC %in% vehiclesSCC, ]
baltimoreVehicles <- vehiclesNEI[vehiclesNEI$fips==24510, ]

png(filename='./data/plot5.png')
library(ggplot2)

ggplot(baltimoreVehicles, aes(factor(year), log10(Emissions))) +
  geom_boxplot(fill='blue') +
  labs(x="Year", y=expression("Baltimore City log"[10]*" PM"[2.5]*" Motor Vehicle Emissions")) + 
  labs(title=expression("Baltimore City log"[10]*" PM"[2.5]*" Motor Vehicle Emissions (1999 - 2008)"))

dev.off()
