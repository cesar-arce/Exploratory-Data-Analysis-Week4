# Peer Graded Assignment: Exploratory Data Analysis Course Project 2 (week 4)

# forming Baltimore data which will be NEI_data subset
baltdata <- NEI[NEI$fips=="24510", ]

# Baltimore yearly emmisisons data
baltYrEmm <- aggregate(Emissions ~ year, baltdata, sum)

####  generates plot2.png
cols1 <- c("maroon", "yellow", "orange", "Aquamarine")
barplot(height=baltYrEmm$Emissions/1000, 
        names.arg=baltYrEmm$year, 
        xlab="Year", 
        ylab=expression('Aggregated Emission'),
        main=expression('Baltimore Aggregated PM'[2.5]*' Emmissions by Year'), col = cols1)

# to generate file plot2.png
dev.copy(png, file="plot2.png", height=480)
dev.off()
