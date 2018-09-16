work_dir <- "/home/kgpavan/RProgramming"

setwd(work_dir)



complete <- function(directory, id = 1:332) {
  
  directory <- ("./specdata/")
  
  id_len <- length(id)
  complete_data <- rep(0, id_len)
  
  all_files <- as.character( list.files(directory) )
  file_paths <- paste(directory, all_files, sep="")
  
  j <- 1 
  for (i in id) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    complete_data[j] <- sum(complete.cases(current_file))
    j <- j + 1
  }
  
  result <- data.frame(id = id, nobs = complete_data)
  return(result)
  
}