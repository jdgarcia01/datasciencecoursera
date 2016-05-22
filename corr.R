# Write a function that takes a directory of data files and a 
# threshold for complete cases and calculates the correlation
# between sulfate and nitrate for monitor locations where the
# number of completely observed cases (on all variables) is 
# greater than the threshold. The function should return a vector
# of correlations for the monitors that meet the threshold requirement.
# If no monitors meet the threshold requirement, then the function 
# should return a numeric vector of length 0. A prototype of this 
# function follows

## Author John D. Garcia
## Purpose: Find the correlation between to variables.  
## We will use the complete.R function found in my Github
## account.  It is a dependancy.  If you do not trust my 
## complete.R function, then you should use complete.cases
## R implementation.  You may have to perform some modifications 
## to this code to get it to work properly.  Cheers!




corr <- function( directory, threshold = 0){
 
  
  # get the complete table
  complete_table <- complete(directory, 1:332)
  
  nobs <- complete_table$nobs
  # find the valid ids
  ids_above_threshold <- complete_table$id[nobs > threshold]
  # get the length of ids vector
  id_len <- length(ids_above_threshold)
  corr_vector <- rep(0, id_len)
  # find all files in the specdata folder
  file_paths <- as.character( list.files(directory, full.names = TRUE) )
  ##file_paths <- paste(directory, all_files)
  j <- 1
  for(i in ids) {
    current_file <- read.csv(file_paths[i], header=T, sep=",")
    corr_vector[j] <- cor(current_file$sulfate, current_file$nitrate, use="complete.obs")
    j <- j + 1
  }
  result <- corr_vector
  return(result)   

  

}