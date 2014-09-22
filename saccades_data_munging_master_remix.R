source('~/Documents/Rprojects/saccades/create_file_list.R')
source('~/Documents/Rprojects/saccades/load_data.R')
source('~/Documents/Rprojects/saccades/create_minute_labels_remix.R')
setwd("~/Documents/Rprojects/saccades")

#the next step requires the data to be in two folders (rested, sleep deprived)
#contained within a folder called 'data'
saccade_data_file_list <- create_file_list()

# create empty data.frame to hold combined data
master <- data.frame()

#loop through the file list and append data to master
#This also contains the code to generate a participant name, minute bin
#and condition variable.
for (i in saccade_data_file_list){
  loopdata <- load_data(i)
  master <- rbind(master,loopdata)
}  

