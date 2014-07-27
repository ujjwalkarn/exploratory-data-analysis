NEI <- readRDS("summarySCC_PM25.rds")
NEIb <- subset(NEI, fips == "24510")

s<-tapply(NEIb$Emissions, NEIb$year, sum)
k<-data.frame(key=names(s), value=s)
png("plot2.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()