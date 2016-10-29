# Question 3 
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a 
# plot answer this question.
library(dplyr)
library(ggplot2)

baltimore <- subset(NEI, NEI$fips == "24510")

grafico <- ggplot(baltimore, aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") +
  theme_bw() + facet_grid(.~type,scales = "free",space="free") + ylab("Emissions") + xlab("Year") + ggtitle("Type source in Baltimore per Year")
png("plot3.png")
print(grafico)
dev.off()