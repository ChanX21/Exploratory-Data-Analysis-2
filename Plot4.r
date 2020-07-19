library(ggplot2)

Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

Data$year <- as.factor(Data$year)

DataTot <- merge(Data,DataSumm, by ="SCC")

CombRelated <- grepl("Comb",DataSumm$SCC.Level.One)
CoalRelated <- grepl("Coal",DataSumm$SCC.Level.Four)
CoalAndComb <- (CombRelated & CoalRelated)
Sources  <-  DataSumm[CoalAndComb,]$SCC  

MainCombSub <- Data[Data$SCC %in% Sources ,]

png("plot4.png",width=700,height=226 ,units="px")

g <- ggplot(data = MainCombSub, aes(year,Emissions))
p <-(g+ geom_point() +geom_bar(stat="identity",fill="light green",width=0.2) + facet_grid(~type) + geom_smooth(method = 'lm') + theme_dark() +  labs(x="Year", y=expression("PM"[2.5]*" Emission")))
print(p)

dev.off()
