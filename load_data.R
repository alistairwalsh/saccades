load_data <- function (fhandle) {
  name <- strsplit(fhandle,' ')
  print(paste('processing',name))
  dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)
  #create minute labels
  dfile <- create_minute_labels(dfile)
  
  #detect if rested
  if (grepl("Rested", fhandle) == TRUE){
    dfile$condition <- as.factor("Rested")
    
    #detect if 7 words or 8 words
    if (length(name[[1]]) == 7 ){
      whois <- strsplit(name[[1]][3],'/')[[1]][2]
      dfile$participant <- as.factor(whois)
    }else if (length(name[[1]]) == 8 ){
      whois <- paste(strsplit(name[[1]][3],'/')[[1]][2],name[[1]][4],sep = '')
      dfile$participant <- as.factor(whois)
    }    
  }
  
  #detect if sleep deprived
  else if (grepl("Sleep Deprived", fhandle) == TRUE){
    dfile$condition <- as.factor("Sleep.Deprived")
    
    #detect if 9 words or 10 words
    if (length(name[[1]])== 9 ){
      whois <- strsplit(name[[1]][4],'/')[[1]][2]
      dfile$participant <- as.factor(whois)
    }else if (length(name[[1]])== 10 ){
      whois <- paste(strsplit(name[[1]][4],'/')[[1]][2],name[[1]][5],sep = '')
      dfile$participant <- as.factor(whois)
    } 
  }

  return(dfile)  
  }