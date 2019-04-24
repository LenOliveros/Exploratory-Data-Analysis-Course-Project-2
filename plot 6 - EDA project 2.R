
## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# 6- Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County,
# California (fips=="06037"). Which city has seen greater changes over time in motor vehicle emissions?

vehiclecol <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicle <- SCC[vehiclecol, ]


Balt_LA <- NEI[(NEI$fips=='24510' | NEI$fips=='06037'),]

Balt_LA_vehicle <- Balt_LA[(complete.cases(Balt_LA$SCC == vehicle$SCC)),]
Balt_LA_vehicle$city <- ifelse(Balt_LA_vehicle$fips == '24510', "Baltimore", "Los Angeles")
EM6 <- aggregate(Emissions ~ year + city,data =  Balt_LA_vehicle, sum)

png("plot6.png")
g <- ggplot(data =  EM6, aes(x= year, y = Emissions, color = city))
g + geom_line(size=1.3) + ggtitle("Evolutions of Emissions from motor vehicle in Baltimore and Los Angeles")+ xlab("year")+ ylab("Emissions PM2.5")
dev.off()



