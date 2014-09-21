load_data <- function (fhandle) {
  dfile <- read.csv(fhandle,header=TRUE,sep='\t',skip = 9)
  return(dfile)
}