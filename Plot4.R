# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

# generates the plot4.png
library(ggplot2)
chart <- ggplot(baltYrTypEmm, aes(factor(year), Emissions, fill=year))
chart <- chart + geom_bar(stat="identity", alpha=0.7, position="stack", label=TRUE) +
    xlab('year') +  
    ylab(expression('Emissions '[PM2.5]*' (million tons)')) +
    ggtitle('Total Emissions from coal sources in the USA from 1999 to 2008')
     print(chart)

# + geom_text(aes(label=Emissions, y = year), data = Emissions,fontface = "bold", size = 2)
# to generate file plot4.png
dev.copy(png, file="plot4.png", height=480)
dev.off()