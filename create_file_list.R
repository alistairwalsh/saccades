# list.files(path = ".", pattern = NULL, all.files = FALSE,
#            full.names = FALSE, recursive = FALSE,
#            ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
# 
# dir(path = ".", pattern = NULL, all.files = FALSE,
#     full.names = FALSE, recursive = FALSE,
#     ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)
# 
# list.dirs(path = ".", full.names = TRUE, recursive = TRUE)
# 
# creating a file list for iterating over and gathering data

create_file_list <- function () {
  setwd("~/Documents/Rprojects/saccades")
  
  folders = list.dirs("data")
  list.files(folders[2])
  list.files(folders[3])
  
  saccade_data_file_list = NULL
  for (f in folders[2:3]){
   
    for (i in list.files(f)) {
      saccade_data_file_list = append(saccade_data_file_list,paste(f,i,sep='/'))
    }
    
  }
  return(saccade_data_file_list)
}
