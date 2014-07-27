library(reshape2)
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
BA <- subset(NEI, fips == "24510")
LA <-  subset(NEI, fips == "06037")

#used separate tapply for both BA and LA data
s1<-tapply(BA$Emissions, BA$year, sum)
k1<-data.frame(key=names(s1), value=s1)

s2<-tapply(LA$Emissions, LA$year, sum)
k2<-data.frame(key=names(s2), value=s2)

#updated column names and merged the two data frames
colnames(k1)<-c("year","BA")
colnames(k2)<-c("year","LA")
y<-merge(k1, k2, by = "year")

z<-melt(y)  #used melt so that ggpplot can be applied

#used ggplot to plot both data in the same plot 
png("plot6.png", width = 800, height = 600)
ggplot(data=z, aes(x=year, y=value, group=variable, colour=variable, shape=variable))+geom_line()+geom_point()
dev.off()

#The plot clearly shows that LA has recored more changes
