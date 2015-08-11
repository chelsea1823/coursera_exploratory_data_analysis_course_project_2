NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

m <- subset(NEI, NEI$fips == "24510")
emissions <- as.numeric(with(m, tapply(Emissions, year, sum)))
year <- unique(m$year)
png("plot2.png")
barplot(emissions, names.arg = year, col = year, main = expression('total PM'[2.5]*' emission at various years in Baltimore City, Maryland'), xlab = "years", ylab = expression('total PM'[2.5]*' emissions'))
dev.off()
