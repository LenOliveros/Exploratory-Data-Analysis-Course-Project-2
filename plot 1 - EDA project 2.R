getwd()

## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## 1- Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot 
## showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

NEI1 <- NEI %>% filter(year == 1999 | year == 2008) 
EM1 <- tapply(NEI1$Emissions, NEI1$year, sum)

png("plot1.png")
barplot(EM1, ylab = "Emissions PM2.5",  col = c("red", "blue"), main = "Total PM2.5 per year comparision" )
dev.off()
