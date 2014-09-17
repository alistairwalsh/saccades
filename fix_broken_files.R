fhandle1 <- saccade_data_file_list[1]
fhandle2 <- saccade_data_file_list[2]
fhandle1
fhandle2


dfile_part1 <- read.csv(fhandle1,header=TRUE,sep='\t',skip = 9)
dfile_part2 <- read.csv(fhandle2,header=TRUE,sep='\t',skip = 9)

tail(dfile_part1[1:6])
head(dfile_part2[1:6])




newname <- strsplit(saccade_data_file_list[2], " part2")
13090691482-12415905404
