# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

# generates plot5.png
# Type: ON-ROAD, Fips = "24510" Baltimore Motor Vehicle PM[2.5]* Emissions from 1999 to 2008
library(ggplot2)
chart <- ggplot(baltYrTypEmm, aes(factor(year), Emissions, fill=year))
chart <- chart + geom_bar(stat="identity") +
    xlab("year") +
    ylab(expression('Total Emissions '[PM2.5]*' (tons)')) +
    ggtitle('Baltimore Motor Vehicle Emissions From 1999 to 2008')
print(chart)

# to generate file plot5.png
dev.copy(png, file="plot5.png", height=480)
dev.off()