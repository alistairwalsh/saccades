load('AH_rested.R')
load('RM_SD.R')

#create blank header in textwrangler - 17 tabs, 9 rows
write.table(RM_SD,"SMI_002RM 20120303 - Sleep Deprived SACCADES.txt",append=TRUE,sep = '\t')

dfiletest <- read.csv('SMI_002RM 20120303 - Sleep Deprived SACCADES.txt',header=TRUE,sep='\t',skip = 9)

#same for AH
write.table(AH_rested,"SMI_008 AH 201230915 - Rested SACCADES.txt",append=TRUE,sep = '\t')

dfiletest <- read.csv('SMI_008 AH 201230915 - Rested SACCADES.txt',header=TRUE,sep='\t',skip = 9)
