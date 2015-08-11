NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

bc <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
la <- subset(NEI, NEI$fips == "06037" & NEI$type == "ON-ROAD")

bc_sum <- with(bc, tapply(Emissions, year, sum))
bc_emissions <- as.numeric(bc_sum)
YEAR <- unique(NEI$year)
la_sum <- with(la, tapply(Emissions, year, sum))
la_emissions <- as.numeric(la_sum)

bcdata <- data.frame(YEAR, bc_emissions)
ladata <- data.frame(YEAR, la_emissions)

png("plot6.png")
library(ggplot2)
d <-  ggplot(bcdata, aes(YEAR, bc_emissions, color = "red"))  
d + geom_line(size = 1) + geom_line(data = ladata, aes(YEAR, la_emissions,col = "blue"), size =1 ) +
  guides(fill = guide_legend(title=NULL))+ 
  labs(x= "Years", y = expression('Total PM'[2.5]*' Emissions'), title = "Emissions from motor vehicle in Baltimore City(Blue)\n vs Los Angeles(Red) 1999 - 2008") 
dev.off()







