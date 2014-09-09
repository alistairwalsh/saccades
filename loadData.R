fhandle <- 'SMI_001WR 20120326_011 - Sleep Deprived SACCADES (1) (1).txt'

dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)

newDfile <- subset.data.frame(dfile, select= c(6,11,12,14))