source('~/Documents/Rprojects/saccades/create_file_list.R')
source('~/Documents/Rprojects/saccades/load_data.R')

saccade_data_file_list <- create_file_list()

list <- saccade_data_file_list[-c(1,2,9,10)]


for (i in saccade_data_file_list){
  assign(paste0('data',i),load_data(saccade_data_file_list[i]))
  
  
}
# master <- data.frame()
# for (i in 1:length(list)){
# print(saccade_data_file_list[i])
# print(i)
# 
# assign(paste0('data',i),load_data(saccade_data_file_list[i]))
# #master <- rbind(paste0('data',i))
# }

name <- strsplit(fhandle,'.txt')[[1]]
short_name <- strsplit(name,'/')[[1]][3]
assign(short_name,dfile)
