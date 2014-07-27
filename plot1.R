NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#after reading the NEI datset, I have used tapply to get the total emission per year
s<-tapply(NEI$Emissions, NEI$year, sum)

#entered these values into a data frame k
k<-data.frame(key=names(s), value=s)

#plooted the values
png("plot1.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()