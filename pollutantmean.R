pollutantmean <- function( directory, pollutant, id  = 1:332){
  ## directory is the path to the files.  
  col_names <- c("Date","sulfate","nitrate","ID")
  
  data_to_process <- 0
  
  ## vector to hold column data that will
  ## used to take the mean.  
  mean_vec <- c()
  
  poll <- list(pollutant)
 
  files_to_read <- list.files(directory, full.names = TRUE)
  
  
  for(index_of_file in id){
   current_file <- read.csv(files_to_read[index_of_file], header = TRUE)
   
  clean_data <- current_file[!is.na(current_file[, pollutant]), pollutant] 
   mean_vec <- c(mean_vec, clean_data)
   
  }
 
  round(mean(mean_vec), 3)

}
