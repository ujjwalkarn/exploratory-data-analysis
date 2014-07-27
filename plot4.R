NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#used grep to select specific rows from Short.Name to get 103 rows
kkk<-SCC[grep("(Comb.*(Lignite))|(Comb.*(Coal))", SCC$Short.Name, ignore.case=TRUE),]

#selected those rows from NEI which have SCC in the values obtained in last step
y <- NEI[NEI$SCC %in% kkk[[1]], ]

s<-tapply(y$Emissions, y$year, sum) #used tapply to find total emissions for selected rows above
k<-data.frame(key=names(s), value=s) #made a data frame

#plotted using base plotting system
png("plot4.png", width = 800, height = 600)
with(k,plot(key,value))
dev.off()