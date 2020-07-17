Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

#Data Frame assigned ---------------------------------------------------------------------------------------

Data$year <- as.factor(Data$year)

BaltimoreSub <- subset(Data, Data$fips == "24510" )

EachYearTot_Baltimore <- aggregate(Emissions ~ year , BaltimoreSub , sum)

png("Plot2.png",width=480,height=480,units="px")
barplot(height = EachYearTot_Baltimore $Emissions ,names = EachYearTot_Baltimore$year, col = " light green ", xlab = " Years ", ylab = expression(' PM'[2.5]*' emission'), main = expression('Total PM'[2.5]*'Emissions Through The Years In Baltimore'))
dev.off()
