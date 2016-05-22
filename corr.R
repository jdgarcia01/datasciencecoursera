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
  ## directory is a character vector to the 
  ## path where our files reside.  
  
  ## Data.frame that has complete data.
  ## NA's have been removed.  
  my_complete_data <- complete(directory,1:332)
  
  ## This should display the number of stations that are above the observation
  ## threshold.  So, if you want to take the correlation between 
  ## sulfate and nitrate from stations that have more than 50 
  ## observations etc. 
  my_threshold_ids <-  my_complete_data$id[my_complete_data$nobs > threshold]
  
  
  my_threshold_ids
  
  # ## File name of each file. 
  # file_name <- my_complete_data$id
  # 
  # 
  # ## Create the path to the directory of data.  
  # full_path_to_file <- paste(directory, "/", file_name, sep = "")
  # 
  # ## Subset of ids i.e. above the threshold. 
  # 
  # 
  # 
  # my_file_data <- sapply(full_path_to_file[], function(file_name){
  #   
  #     file_data <- read.csv(file_name, header = TRUE)
  #     file_data <- na.omit(file_data)
  #     
  #   ##  file_data$sulfate
  #    correlation <- cor(file_data$sulfate, file_data$nitrate, use = "complete" )
  #    
  #   
  # }, simplify = "array")
  # 
  # my_file_data
  # 
  # 
  # 
  # 
  # 
  
  
  
}