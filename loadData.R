fhandle <- 'SMI_001WR 20120326_011 - Sleep Deprived SACCADES (1) (1).txt'

dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)


newDfile <- subset.data.frame(dfile, select= c(6,11,12,14))
summary(newDfile)
names(newDfile)
plot(density(newDfile$Average.Speed))
boxplot(dfile[6])
barplot(sort(dfile$Duration))
graph1 <- hist(dfile$Duration,plot = TRUE,breaks='fd')
plot(graph1)

graph1 <- hist(dfile$Average.Speed,plot = TRUE,breaks='fd')
plot(graph1)

graph1 <- hist(dfile$Peak.Speed,plot = TRUE,breaks='fd')
plot(graph1)

graph1 <- hist(dfile$Amplitude,plot = TRUE,breaks='fd')
plot(graph1)

model = lm(dfile$Amplitude~dfile$Duration)
plot(dfile$Duration,dfile$Amplitude)
abline(model$coefficients,col='red')
cor(dfile$Duration,dfile$Amplitude)
