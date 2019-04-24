getwd()

## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 5- How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
vehiclecol <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicle <- SCC[vehiclecol, ]


balt_maryland <- NEI[(NEI$fips=='24510'),]

Baltimore_VEHICLE <- balt_maryland[(complete.cases(balt_maryland$SCC == vehicle$SCC)),]

VEHICLE_VAR <- Baltimore_VEHICLE %>% filter(year == 1999 | year == 2008)


EM5 <- tapply(VEHICLE_VAR$Emissions, VEHICLE_VAR$year, sum)

png("plot5.png")
barplot(EM5, ylab = "Emissions PM2.5", xlab = "Year", main = "Emissions from vehicles variation from 1999-2008", 
        col = c("red", "yellow"))
dev.off()




