Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

#Dataframe Assigned as above -------------------------------------------------------------------------------

Data$year <- as.factor(Data$year)

EachYearTot <- aggregate(Emissions ~ year , Data , sum)

png("Plot1.png",height = 480 , width = 480, units = "px")
barplot(height = EachYearTot$Emissions ,names = EachYearTot$year, col = " green", xlab = " Years ", ylab = expression(' PM'[2.5]*' emission'), main = expression('Total PM'[2.5]*'Emissions Through The Years [1999 - 2008]'))
dev.off()
