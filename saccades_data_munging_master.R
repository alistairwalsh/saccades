source('~/Documents/Rprojects/saccades/create_file_list.R')
source('~/Documents/Rprojects/saccades/load_data.R')


master <- data.frame()
saccade_data_file_list <- create_file_list()

for (i in list){

dfile <- load_data(i)

rbind(master,dfile)
}

name <- strsplit(fhandle,'.txt')[[1]]
short_name <- strsplit(name,'/')[[1]][3]
assign(short_name,dfile)
