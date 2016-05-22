
complete <- function(directory, id = 1:332) {
  
 
  # get the length of id vector
  id_len <- length(id)
  
  ## used to hold our result.
  sum_of_obs_per_station <- rep(0, id_len)
  
 
  
  file_paths <- as.character( list.files(directory, full.names = TRUE) )
 
  ## Start counting at one....
  j <- 1 
  for (file_name in id) {
    ## read the contents of each file. 
    current_file <- read.csv(file_paths[file_name], header=TRUE)
    
    ## Multiple functions in one.  Complete.cases, handle NA's. 
    ## Sum to count how many rows/cases in each file are complete (No NA's)
    sum_of_obs_per_station[j] <- sum(complete.cases(current_file))
    
    ## increment our index.  
    j <- j + 1
  }
  
  ## Create a data.frame from the results  id is a vector, nobs is a vector. 
  result <- data.frame(id = id, nobs = sum_of_obs_per_station)
  
  ## return our result. 
  return(result)
   
   
   
} 