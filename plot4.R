NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# coal combustion-realated source 
sub <- SCC[grep('coal', SCC$Short.Name, ignore.case = TRUE),]
col <- sub$SCC
subsetNEI <- subset(NEI, SCC %in% col)
library(ggplot2)
png("plot4.png")
d <- ggplot(subsetNEI, aes(x = factor(year), y = Emissions, fill = factor(year)))
d + geom_bar(stat = "identity") + scale_fill_brewer(palette = "Set1")  + 
  guides(fill = guide_legend(title=NULL)) +
  labs(title = "Emission from coal combustion-related sources\n at various years", x = "Years", y = expression('Total PM'[2.5]*' Emissions'))
dev.off()
