# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

# Comparing Baltimore, MD-24510 and Los Angeles, CA-06037
baltYrTypEmmFips <- summarise(group_by(filter(NEI, NEI$fips == "24510"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))
laYrTypEmmFips <- summarise(group_by(filter(NEI, NEI$fips == "06037"& type == 'ON-ROAD'), year), Emissions=sum(Emissions))

baltYrTypEmmFips$County <- "Baltimore City, MD"
laYrTypEmmFips$County <- "Los Angeles County, CA"

baltLaEmissions <- rbind(baltYrTypEmmFips, laYrTypEmmFips)

####  generates plot6.png
# Type: ON-ROAD, Fips = 24510 for Baltimore, MD Motor Vehicle PM[2.5]* Emissions Against Los Angeles, CA Fips = 06037  from 1999 to 2008
library(ggplot2)
ggplot(baltLaEmissions, aes(x=factor(year), y=Emissions, fill=County,label = round(Emissions,2))) +
    geom_bar(stat="identity") + 
    facet_grid(County~., scales="free") +
    xlab("year") +
    ylab(expression("total PM"[2.5]*" emissions in tons")) + 
    ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in Tons"))+
    geom_label(aes(fill = County),colour = "yellow", fontface = "bold")

# to generate file plot6.png
dev.copy(png, file="plot6.png", height=480)
dev.off()