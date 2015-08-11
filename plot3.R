NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

png("plot3.png")
m <- subset(NEI, NEI$fips == "24510")
library(ggplot2)
d <- ggplot(m, aes(x = factor(year), y = Emissions, fill = factor(year)))
d + geom_bar(stat = "identity") + scale_fill_brewer(palette = "Set1") + 
  guides(fill = guide_legend(title=NULL))+
  facet_grid(~type) + 
  labs(title = "PM2.5 Emissions in Baltimore City, MD\n at different years from various sources", x = "Years", y = expression('Total PM'[2.5]*' Emissions'))
dev.off()             
