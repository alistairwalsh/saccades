'''
list.files(path = ".", pattern = NULL, all.files = FALSE,
           full.names = FALSE, recursive = FALSE,
           ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

dir(path = ".", pattern = NULL, all.files = FALSE,
    full.names = FALSE, recursive = FALSE,
    ignore.case = FALSE, include.dirs = FALSE, no.. = FALSE)

list.dirs(path = ".", full.names = TRUE, recursive = TRUE)

creating a file list for iterating over and gathering data
'''


folders = list.dirs("~/Dropbox/Ocular data/raw data")
list.files(folders[2])
list.files(folders[3])

for (f in folders[2:3]){
  for (i in list.files(f)) {
    print(paste(f,i,sep='/'))
  }
}