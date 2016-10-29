# Question 6
# Compare emissions from motor vehicle 
# sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, 
#California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(dplyr)
library(ggplot2)

baltimore <- NEI[(NEI$fips=="24510"),]
angeles <- NEI[(NEI$fips=="06037"),]
is.vehicle <- grepl("Vehicle",SCC$EI.Sector,ignore.case = TRUE)
vehicles <- subset(SCC,is.vehicle)
baltimore <- baltimore[(baltimore$SCC %in% vehicles$SCC),]
angeles <- angeles[(angeles$SCC %in% vehicles$SCC),]

baltimore.vehicles <- aggregate(Emissions ~ year, data=baltimore, FUN=sum)
angeles.vehicles <- aggregate(Emissions ~ year, data=angeles, FUN=sum)
baltimore.vehicles$city <- "Baltimore City"
angeles.vehicles$city <- "Los Angeles"
vehiculos <- rbind(baltimore.vehicles,angeles.vehicles)

png("plot6.png")
grp <- ggplot(vehiculos, aes(x = factor(year), y = Emissions, fill=city)) + geom_bar(stat="identity", position = "dodge") + xlab("Year") + ylab("Emissions") + ggtitle("Emissions from Vehicles from Baltimore and Los Angeles") + scale_y_log10()
print(grp)
dev.off()