NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

s<-tapply(NEI$Emissions, NEI$year, sum)
k<-data.frame(key=names(s), value=s)
png("plot1.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()