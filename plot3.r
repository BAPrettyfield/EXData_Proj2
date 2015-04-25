#  plot3.r

library("ggplot2")

NEI <- readRDS("summarySCC_PM25.rds")
balt <- NEI[NEI$fips=="24510",]

qplot(year, Emissions, data=balt, facets=.~type, 
      geom=c("point", "smooth"), method="loess") + 
      labs(title="Baltimore Emissions by source")


#  Now copy the plot to a png file
dev.copy(png, file='plot3.png', width = 960, height = 480 )
dev.off()

