load_data <- function (fhandle) {
  dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)
  name <- strsplit(fhandle,' ')
  
  if (grepl("Rested", fhandle) == TRUE){
    if (length(name[[1]]) == 7 ){
      print('rested, name = 7')
      whois <- strsplit(name[[1]][3],'/')[[1]][2]
      dfile$participant <- as.factor(whois)
    }else if (length(name[[1]]) == 8 ){
      print('rested, name = 8')
      whois <- paste(strsplit(name[[1]][3],'/')[[1]][2],name[[1]][4],sep = '')
      dfile$participant <- as.factor(whois)
    } 
    print('condition = rested')
    dfile$condition <- as.factor("Rested")   
  }
  
  else if (grepl("Sleep Deprived", fhandle) == TRUE){
    if (length(name[[1]])== 9 ){
      print('sleep deprived, name = 9')
      whois <- strsplit(name[[1]][4],'/')[[1]][2]
      dfile$participant <- as.factor(whois)
    }else if (length(name[[1]])== 10 ){
      print('sleep deprived, name = 10')
      whois <- paste(strsplit(name[[1]][4],'/')[[1]][2],name[[1]][5],sep = '')
      dfile$participant <- as.factor(whois)
    }
    print('condition = Sleep.deprived')
    dfile$condition <- as.factor("Sleep.Deprived")
  }
  print(whois)
  assign(dfile,whois)
  return(whois)  
  }