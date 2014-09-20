fhandle1 <- saccade_data_file_list[1]
fhandle2 <- saccade_data_file_list[2]
fhandle1
fhandle2


dfile_part1 <- read.csv(fhandle1,header=TRUE,sep='\t',skip = 9)
dfile_part2 <- read.csv(fhandle2,header=TRUE,sep='\t',skip = 9)

tail(dfile_part1[1:6])
head(dfile_part2[1:6])

#read in start_values
start_times <- read.csv('start_time_machine_readable.csv',header = TRUE, sep = ',')

#slice out start time for AH part2
AH_part2_start <- start_times$Start[start_times$Participant == 'AH' & start_times$Notes == 'part2' ]

#convert to my time base
start_value <- AH_part2_start*1000

#get the next saccade that is after that time,  
starting_line <- dfile_part2[dfile_part2$Start>= AH_part2_start*1000,][1,]
starting_line$Start

#ok now get the last three saccades from part one and find an average inter saccade time.
dfile_part1[(nrow(dfile_part1)-3):(nrow(dfile_part1)),c(4:5)]

#dfile_part1 has 4334 obs. start col is 4, end col is 5
IST1 <- (dfile_part1[4332,4]-dfile_part1[4331,5])
IST2 <- (dfile_part1[4333,4]-dfile_part1[4332,5])
IST3 <- (dfile_part1[4334,4]-dfile_part1[4333,5])
IST <- mean(IST1,IST2,IST3)

#meanIST is 937935, add this to end of part 1
part2_start <- dfile_part1[4333,5] + IST

#how much do I need to change part2 times by?
diff_to_take <- starting_line$Start - part2_start
diff_to_take

# make a copy and change start and end times by this much
dfile_part2_shifted <- dfile_part2
dfile_part2_shifted$Start <- dfile_part2_shifted$Start - diff_to_take
dfile_part2_shifted$End <- dfile_part2_shifted$End - diff_to_take

#check this
dfile_part2$Start - dfile_part2_shifted$Start
dfile_part2$End - dfile_part2_shifted$End

dfile_part2[171: nrow(dfile_part2),]

newname <- strsplit(saccade_data_file_list[2], " part2")
13090691482-12415905404
