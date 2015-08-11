NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sum <- with(NEI, tapply(Emissions, year, sum))
emissions <- as.numeric(sum)
year <- unique(NEI$year)
png("plot1.png")
barplot(emissions, names.arg = year, col = year, main = expression('total PM'[2.5]*' emission at various years'), xlab = "years", ylab = expression('total PM'[2.5]*' emissions'))
dev.off()
