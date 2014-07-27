NEI <- readRDS("summarySCC_PM25.rds")

#selected only those rows where type is ON-ROAD as by my understanding, those will be motor vehicles
NEIr <- subset(NEI, type == "ON-ROAD") 

#used tapply to get total emission and the made a dataframe
s<-tapply(NEIr$Emissions, NEIr$year, sum)
k<-data.frame(key=names(s), value=s)

#plotted 
png("plot5.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()