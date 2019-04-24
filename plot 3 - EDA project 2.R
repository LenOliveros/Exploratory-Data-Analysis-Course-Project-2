getwd()


## STEP 1 - Reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## 3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
## variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have 
## seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

baltimoreM <- NEI %>% filter(fips == "24510")

BEM2 <-  aggregate(Emissions ~ year + type, baltimoreM, sum)


png("plot3.png")
g <- ggplot(data = BEM2, aes(x=year, y=Emissions, col = type))
g + geom_line(size = 1.3) + ylab("Total Emissions PM2.5 in Baltimore") +xlab("Year")+ggtitle("Baltimore PM2.5 Emissions per type")
dev.off()


