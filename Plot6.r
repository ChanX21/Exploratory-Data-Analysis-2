library(ggplot2)

Data <- readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/summarySCC_PM25.RDS")
DataSumm <-readRDS("C:/Users/SUN/Documents/R Studio Scripts/Course4 Project/Source_Classification_Code.RDS")

Data$year <- as.factor(Data$year)
DataTot <- merge(Data,DataSumm, by ="SCC")

VehicleCases <- grepl("vehicle",DataSumm$SCC.Level.Two)
vehiclesCasesSub <- DataSumm[VehicleCases,]$SCC
VehicleFinalSub <- Data[Data$SCC %in% vehiclesCasesSub,]
BaltimoreFinalSub <- VehicleFinalSub[VehicleFinalSub$fips=="24510",]

LaFinalSub <-  VehicleFinalSub[VehicleFinalSub$fips=="06037",]

BaltimoreFinalSub$City <- "Baltimore City"
LaFinalSub$City <- "Los Angeles"

BothCitiesSub <- rbind (BaltimoreFinalSub,LaFinalSub )
BothCitiesSub$City <- as.factor(BothCitiesSub$City)

png("Plot6.png" , height =226 , width = 700 ,units = "px")

g <- ggplot(BothCitiesSub,aes(year,Emissions)) +  geom_bar(stat = "identity" ,fill="light green",width=0.20) +
  theme_bw()  +facet_grid(.~City)+  labs(x="Year", y=expression("PM"[2.5]*" Emission")) + theme_dark() +
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore And LA Cities"))
print(g)

dev.off()
