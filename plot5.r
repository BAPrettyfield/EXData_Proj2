#  plot5.r

library("ggplot2")

#  Read in the NEI data

NEI <- readRDS("summarySCC_PM25.rds")

#  Select just the Baltimore data

balt <- NEI[NEI$fips=="24510",]


#  Select the rows in the SCC data which have "Mobile Sources" in the
#  SCC.Level.One field

SCCT_mobile <- SCCT[grep('Mobile Sources', SCCT$SCC.Level.One), ]


#  Extract the SCC values from the SCCT_mobile data frame

c <- SCCT_mobile$SCC


#  Now create a subset of the NEI data frame which contains
#  only those rows which have an SCC number in c

NEI_mobile_balt <- balt[balt$SCC %in% c,]

#  Aggregate the emissions by year

yearly.totals <- aggregate(Emissions~year, NEI_mobile_balt, sum)

#  Now plot the results

qplot(year, Emissions, data=yearly.totals, 
      geom=c("point", "smooth"), method="loess" ) + 
  labs(title="Baltimore Motor Vehicle Emissions over Time")


#  Now copy the plot to a png file
dev.copy(png, file='plot5.png', width = 960, height = 480 )
dev.off()

