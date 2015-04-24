#  plot1.r

NEI <- readRDS("summarySCC_PM25.rds")

yearlyEmissions <- aggregate(Emissions~year, NEI, sum)

with(yearlyEmissions, plot(year, Emissions))

#  Now copy the plot to a png file
dev.copy(png, file='plot1.png', width = 480, height = 480 )
dev.off()

