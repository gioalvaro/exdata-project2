# Question 5 
# How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(dplyr)
library(ggplot2)

baltimore <- NEI[(NEI$fips=="24510"),]
is.vehicle <- grepl("Vehicle",SCC$EI.Sector,ignore.case = TRUE)
vehicles <- subset(SCC,is.vehicle)
baltimore <- baltimore[(baltimore$SCC %in% vehicles$SCC),]
baltimore.vehicles <- aggregate(Emissions ~ year, data=baltimore, FUN=sum)
png("plot5.png")
grp <- ggplot(baltimore.vehicles, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +  xlab("year") +  ylab("Emissions") +
  ggtitle("Emissions from motor vehicle sources in Baltimore")
print(grp)
dev.off()