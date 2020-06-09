# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

# Baltimore yearly emmisisons data
baltYrTypEmm <- aggregate(Emissions ~ year+ type, baltdata, sum)

# generate plot3.png
library(ggplot2)
chart <- ggplot(baltYrTypEmm, aes(year, Emissions, color = type))
chart <- chart + geom_line() +
    xlab("year") +
    ylab(expression('Emissions '[PM2.5]*' (tons)')) +
    ggtitle("Total Baltimore Emissions from 1999 to 2008")
print(chart)

# to generate file plot3.png
dev.copy(png, file="plot3.png", height=480)
dev.off()