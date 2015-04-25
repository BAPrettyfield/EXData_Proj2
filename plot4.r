#  plot4.r

library("ggplot2")

#  Read in the NEI data

NEI <- readRDS("summarySCC_PM25.rds")


#  Select the rows in the SCC data which have "Coal" in th
#  SCC.Level.Three fields

SCCT_coal <- SCCT[grep('Coal', SCCT$SCC.Level.Three), ]


#  Extract the SCC values from the SCCT_coal data frame
c <- SCCT_coal$SCC

#  Now create a subset of the NEI data frame which contains
#  only those rows which have an SCC number in c

NEI_carbon <- NEI[NEI$SCC %in% c,]

#  Aggregate the emissions by year

yearly.totals <- aggregate(Emissions~year, NEI_carbon, sum)

#  Now plot the results

qplot(year, Emissions, data=yearly.totals, 
      geom=c("point", "smooth"), method="loess" ) + 
  labs(title="US Carbon Emissions over Time")


#  Now copy the plot to a png file
dev.copy(png, file='plot4.png', width = 960, height = 480 )
dev.off()

