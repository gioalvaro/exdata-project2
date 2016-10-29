
# Question 1 
# Have total emissions from PM2.5 decreased in the United States
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each 
# of the years 1999, 2002, 2005, and 2008.
library(dplyr)

group.Emissions.Year <- aggregate(NEI$Emissions ~ NEI$year, FUN = sum)
names(group.Emissions.Year) <- c("Year","Emissions")
png("plot1.png")
barplot(height = group.Emissions.Year$Emissions/10000, width = group.Emissions.Year$Year, 
        xlab = "Year", ylab = "Emissions / 10000", main = "Total Emissions per Year",names.arg = group.Emissions.Year$Year)
dev.off()