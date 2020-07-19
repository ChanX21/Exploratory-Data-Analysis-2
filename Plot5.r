library(ggplot2)

Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

Data$year <- as.factor(Data$year)
DataTot <- merge(Data,DataSumm, by ="SCC")

VehicleCases <- grepl("vehicle",DataSumm$SCC.Level.Two)
vehiclesCasesSub <- DataSumm[VehicleCases,]$SCC
VehicleFinalSub <- Data[Data$SCC %in% vehiclesCasesSub,]
BaltimoreFinalSub <- VehicleFinalSub[VehicleFinalSub$fips=="24510",]

png("Plot5", height ="226", width="700",unit ="px")

g <- ggplot(BaltimoreFinalSub,aes(year,Emissions)) +  geom_bar(stat = "identity" ,fill="light green",width=0.20) +
  theme_bw()  +  labs(x="Year", y=expression("PM"[2.5]*" Emission")) + theme_dark() +
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore"))
print(g)

dev.off()
