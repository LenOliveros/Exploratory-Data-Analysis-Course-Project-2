getwd()

## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 4 - Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

coalcol <- grepl("coal", SCC$Short.Name, ignore.case = TRUE)
coal <- SCC[coalcol,]


NEI_COAL <- NEI[complete.cases(NEI[(NEI$SCC == coal$SCC),]),]
COAL_VAR <- NEI_COAL %>% filter(year == 1999 | year == 2008)

EM4 <- tapply(COAL_VAR$Emissions, COAL_VAR$year, sum)

png("plot4.png")
barplot(EM4, ylab = "Emissions PM2.5", xlab = "Year", main = "Emissions from coal combustion-related variation from 1999-2008", 
        col = c("red", "green"))
dev.off()
