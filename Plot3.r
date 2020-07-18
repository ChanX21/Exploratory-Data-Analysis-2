library(ggplot2)

Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

Data$year <- as.factor(Data$year)


BaltimoreSub <- subset(Data, Data$fips == "24510" )

EachYearTotType_Baltimore <- aggregate(Emissions ~ year+type , BaltimoreSub , sum)

png("Plot3.png", width=480, height=480)
g <- ggplot(data = EachYearTotType_Baltimore, aes(year,Emissions))
p <-(g+ geom_point() + facet_grid(~type) + geom_smooth(method = 'lm') + theme_dark())
print(p)

dev.off()
