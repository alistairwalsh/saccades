# get file handle to load data for RM
fhandle1 <- saccade_data_file_list[9]
fhandle2 <- saccade_data_file_list[10]
fhandle1
fhandle2

# load data
dfile_part1 <- read.csv(fhandle1,header=TRUE,sep='\t',skip = 9)
dfile_part2 <- read.csv(fhandle2,header=TRUE,sep='\t',skip = 9)

#Display data
tail(dfile_part1[1:6])
head(dfile_part2[1:6])

#read in start_values
start_times <- read.csv('start_time_machine_readable.csv',header = TRUE, sep = ',')

#slice out start time for AH part2
RM_part2_start <- start_times$Start[start_times$Participant == 'RM' & start_times$Notes == 'part 2' ]
RM_part2_start


#get the next saccade that is after that time, *1000 is to convert from milli to micro 
starting_line <- dfile_part2[dfile_part2$Start>= RM_part2_start*1000,][1,]
starting_line$Start

#ok now get the last three saccades from part one and find an average inter saccade time.
IST_table <- dfile_part1[(nrow(dfile_part1)-3):(nrow(dfile_part1)),c(4:5)]

#dfile_part1 has 5973 obs. start col is 4, end col is 5
IST1 <- (IST_table$Start[2]-IST_table$End[1])
IST2 <- (IST_table$Start[3]-IST_table$End[2])
IST3 <- (IST_table$Start[4]-IST_table$End[3])
IST <- mean(IST1,IST2,IST3)

#meanIST is 937935, add this to end of part 1
part2_start <- dfile_part1[nrow(dfile_part1),5] + IST

#how much do I need to change part2 times by?
diff_to_take <- starting_line$Start - part2_start
diff_to_take

# make a copy and change start and end times by this much
dfile_part2_shifted <- dfile_part2
dfile_part2_shifted$Start <- dfile_part2_shifted$Start - diff_to_take
dfile_part2_shifted$End <- dfile_part2_shifted$End - diff_to_take

#check this - the difference is the same :-)
dfile_part2$Start - dfile_part2_shifted$Start
dfile_part2$End - dfile_part2_shifted$End

#is the mean saccade length of the shifted file equal to the original - yes :-)
mean(dfile_part2[,5]-dfile_part2[,4])==mean(dfile_part2_shifted[,5]-dfile_part2_shifted[,4])

#bind the shifted second part to the first part
dfile_complete <- rbind(dfile_part1,dfile_part2_shifted)
#check answer is TRUE :-)
nrow(dfile_part1)+nrow(dfile_part2)==nrow(dfile_complete)
#Is the mean duration (as a column) of part1 and part 2 equal to the mean 
#duration (calculated from start and end values) of the newly created file?
# :-) yes! Both directly comparing mean Duration and calculating it from start to end

mean(c(dfile_part1$Duration,dfile_part2$Duration))==mean(dfile_complete$Duration)
mean(c(dfile_part1$Duration,dfile_part2$Duration))==mean(dfile_complete$End-dfile_complete$Start)

#Is the length sensible - Yes :-) 78.4204 minutes?
((dfile_complete$End[nrow(dfile_complete)]-dfile_complete$Start[1])/1000000)/60

# fhandle_complete <- paste0('SMI_'
#                            ,substr(fhandle1,30,32)
#                            ,substr(fhandle1,34,55)
#                            ,substr(fhandle1,62,73))


####################################

save(RM_SD,file='RM_SD.R')
load('RM_SD.R')
#To load data and rename to AH_rested
load('SMI_008AH 201230915 - Rested SACCADES.txt' )
RM_SD <- dfile_complete

