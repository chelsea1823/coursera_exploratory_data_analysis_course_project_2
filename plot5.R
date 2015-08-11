NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

motor <- subset(NEI, NEI$fips == "24510" & NEI$type == "ON-ROAD")
library(ggplot2)
png("plot5.png")
d <- ggplot(motor, aes(x = factor(year), y = Emissions, fill = factor(year)))
d + geom_bar(stat = "identity") + scale_fill_brewer(palette = "Set1")  + 
  guides(fill = guide_legend(title=NULL)) +
  labs(title = "Emission from motor vehicle sources\n in Baltimore City at various years", x = "Years", y = expression('Total PM'[2.5]*' Emissions'))
dev.off()
