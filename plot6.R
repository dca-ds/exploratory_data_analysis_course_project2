NEI <- readRDS("./data/summarySCC_PM25.rds")
SCC <- readRDS("./data/Source_Classification_Code.rds")

vehiclesBaltimore <- vehiclesNEI[vehiclesNEI$fips == "24510",]
vehiclesBaltimore$city <- "Baltimore City"
vehiclesLA <- vehiclesNEI[vehiclesNEI$fips=="06037",]
vehiclesLA$city <- "Los Angeles County"
both <- rbind(vehiclesBaltimore, vehiclesLA)

library(ggplot2)
png(filename='./data/plot6.png')

ggplot(both, aes(x=factor(year), y=Emissions)) +
          geom_bar(aes(fill=year),stat="identity") + guides(fill=F) + 
          facet_grid(.~city) +
          labs(x="Year", y=expression("Total PM"[2.5]*" Motor Vehicle Emission (tons)")) + 
          labs(title=expression("Total PM"[2.5]*" Motor Vehicle Emissions: Baltimore & LA (1999 - 2008)"))

dev.off()
