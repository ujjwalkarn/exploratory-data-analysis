NEI <- readRDS("summarySCC_PM25.rds")
NEIb <- subset(NEI, fips == "24510")

z<-tapply(NEIb$Emissions, list(NEIb$year, NEIb$type), sum)


png("plot3.png", width = 800, height = 600)

ggplot(data=melt(z), aes(x=Var1, y=value, group=Var2, colour=Var2, shape=Var2))+geom_line()+geom_point()

#ggsave(file="plot3.pmg", plot=image, width=10, height=8)
dev.off()