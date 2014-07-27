NEI <- readRDS("summarySCC_PM25.rds")
NEIb <- subset(NEI, fips == "24510")  #created a subset for Baltimore

#used tapply to find total emission by type and also by year
z<-tapply(NEIb$Emissions, list(NEIb$year, NEIb$type), sum) 

#plotted using ggplot
png("plot3.png", width = 800, height = 600)
ggplot(data=melt(z), aes(x=Var1, y=value, group=Var2, colour=Var2, shape=Var2))+geom_line()+geom_point()
dev.off()