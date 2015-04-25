#  plot2.r

NEI <- readRDS("summarySCC_PM25.rds")

balt <- NEI[NEI$fips=="24510",]

yearlyEmissions <- aggregate(Emissions~year, balt, sum)

with(yearlyEmissions, plot(year, Emissions))
title(main= "Yearly Total PM2.5 Emissions for Baltimore")

#  Now copy the plot to a png file
dev.copy(png, file='plot2.png', width = 480, height = 480 )
dev.off()

