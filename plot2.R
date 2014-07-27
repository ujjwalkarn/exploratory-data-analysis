NEI <- readRDS("summarySCC_PM25.rds")
NEIb <- subset(NEI, fips == "24510") #created a subset for Baltimore 

s<-tapply(NEIb$Emissions, NEIb$year, sum) #used tapply to find total emissions per year
k<-data.frame(key=names(s), value=s) #put the values in a dataframe k

#plotted
png("plot2.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()