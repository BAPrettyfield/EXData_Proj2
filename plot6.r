#  plot4.r

library("ggplot2")

#  Read in the NEI data

NEI <- readRDS("summarySCC_PM25.rds")

#  Select just the LA and Baltimore data

area_selector = c("24510", "06037")
balt_LA <- NEI[NEI$fips %in% area_selector,]


#  Select the rows in the SCC data which have "Mobile Sources" in the
#  SCC.Level.One field

SCCT_mobile <- SCCT[grep('Mobile Sources', SCCT$SCC.Level.One), ]


#  Extract the SCC values from the SCCT_mobile data frame

c <- SCCT_mobile$SCC


#  Now create a subset of the NEI data frame which contains
#  only those rows which have an SCC number in c

balt_LA_mobile <- balt_LA[balt_LA$SCC %in% c,]


#  Now plot the results

qplot(year, Emissions, data=balt_LA_mobile, facets = . ~ fips, geom=c("point", "smooth"), method = "lm")
  + labs(title="LA (06037) vs Baltimore (24510) Motor Vehicle Emissions over Time")


#  Now copy the plot to a png file
dev.copy(png, file='plot6.png', width = 960, height = 480 )
dev.off()

