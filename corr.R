work_dir <- "/home/kgpavan/RProgramming"

setwd(work_dir)
corr <- function(directory, threshold = 0) {
  
  
  directory <- ("./specdata/")
  complete_table <- complete("specdata", 1:332)
  nobs <- complete_table$nobs
  ids <- complete_table$id[nobs > threshold]
  id_len <- length(ids)
  
  corr_vector <- rep(0, id_len)
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  j <- 1
  for(i in ids) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)   
}