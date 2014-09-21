load_data <- function (fhandle) {
  dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)
  name <- strsplit(fhandle,' ')
  
  if (grepl("Rested", fhandle) == TRUE){
    if (length(name) == 7 ){
      print('rested, name = 7')
      dfile$participant <- as.factor(strsplit(name[[1]][3],'/')[[1]][2])
    }else if (length(name) == 8 ){
      print('rested, name = 8')
      dfile$participant <- as.factor(paste(strsplit(name[[1]][3],'/')[[1]][2],name[[1]][4],sep = ''))
    } 
    print('condition = rested')
    dfile$condition <- as.factor("Rested")   
  }
  
  else if (grepl("Sleep Deprived", fhandle) == TRUE){
    if (length(name)== 9 ){
      print('sleep deprived, name = 9')
      dfile$participant <- as.factor(strsplit(name[[1]][4],'/')[[1]][2])
    }else if (length(name)== 10 ){
      print('sleep deprived, name = 10')
      dfile$participant <- as.factor(paste(strsplit(name[[1]][4],'/')[[1]][2],name[[1]][5],sep = ''))
    }
    print('condition = Sleep.deprived')
    dfile$condition <- as.factor("Sleep.Deprived")
  }
    
  return(dfile)  
  }