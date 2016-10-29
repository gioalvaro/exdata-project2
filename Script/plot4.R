# Question 4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
library(dplyr)
library(ggplot2)

is.coal.fuel.combustion <- grepl("Fuel Comb.*Coal",SCC$EI.Sector)
coal.fuel.combustion <- subset(SCC,is.coal.fuel.combustion)
emisiones <- NEI[(NEI$SCC %in% coal.fuel.combustion$SCC), ]
group.Year <- group_by(emisiones,year)
group.coal.fuel.comb.emissions.year <- summarise(group.Year,Emissions = sum(Emissions))
png("plot4.png")
grf <- ggplot(group.coal.fuel.comb.emissions.year,aes(x = factor(year), y = Emissions)) + 
  theme_bw() + geom_bar(stat="identity") + xlab("Year") + ylab("Emissions") + 
  ggtitle("Emissions per Year for Coal Fuel Combustion") + scale_y_sqrt()
print(grf)
dev.off()