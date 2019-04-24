getwd()

## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 2- Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510")
## from 1999 to 2008? Use the base plotting system to make a plot answering this question.

balt <- NEI %>% filter(fips == "24510")
baltimore <- balt %>% filter(year == 1999 | year == 2008)
View(baltimore)

BEM <- tapply(baltimore$Emissions,baltimore$year, sum)

png("plot2.png")
barplot(BEM,  ylab = "Emissions PM2.5",  col = c("green", "yellow"), main = "Total PM2.5 per year comparision in Baltimore city")
dev.off()
