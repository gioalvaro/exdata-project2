# Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.
library(dplyr)
baltimore <- subset(NEI, NEI$fips == "24510")
grp <- group_by(baltimore,year)
group.Emissions.Year <- summarise(grp,Emissions = sum(Emissions))
png("plot2.png")
barplot(height = group.Emissions.Year$Emissions,names.arg = group.Emissions.Year$year, xlab = "Year" ,
        ylab="Emissions", main="Total Emissions per Year in Baltimore")
dev.off()