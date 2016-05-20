complete <- function(directory, id = 1:332){

  ## Read a directory of files and return a dataframe 
  ## of the filename and number of complete observations 
  ## in each file. 
  files_to_read   <- list.files(directory, full.names = TRUE)
  data_from_files <- 0
 

  # get the data frame and remove the NA values. 
  my_file_data <- sapply(files_to_read[id], function(index){
    
    ## Read in the data in a frame
    data_from_files <- read.csv(index, header = TRUE)
    
    ## pull out the NA values.
    data_from_files <- na.omit(data_from_files)
    
    ## get our row count from the cleaned frame. 
    number_of_rows  <- nrow(data_from_files)
    
    ## bind the two together....
    my_vector <- c(basename(index), number_of_rows)
    
  }, simplify = "array", USE.NAMES = FALSE)
  
  
 ## transpose the returned matrrix and make it a data.frame.
 my_data <- data.frame(t(my_file_data))
 
 ## Add the names to the data.frame
 names(my_data) <- c("id","nob")
 
 ## Return the data.frame.
 my_data
 
  

 
 
 
 
  
  
  
}

pollutantmean <- function( directory, pollutant, id  = 1:332){
  ## directory is the path to the files.  
  col_names <- c("Date","sulfate","nitrate","ID")
  files_to_read <- list.files(directory, full.names = TRUE)
  data_to_process <- 0
  my_mean <- 0
  
  poll <- list(pollutant)

  
 ## print( poll )
 ## return
  
  ## we now have a vector.  we will read the files
  ## requested by the user. 
   index_of_data <- lapply(files_to_read[id], function(index){
     
     data_to_process <- read.csv(index, header = TRUE, col.names = col_names )
  
  })
 
  if(poll == "nitrate"){
   for( i in index_of_data){
     
    
    my_mean <- mean( i$nitrate, na.rm = TRUE)
   }
  }  else if(poll == "sulfate"){
    
    for( i in index_of_data){
      
      
      my_mean <- mean( i$sulfate, na.rm = TRUE)
    }
    
    
  } else {
    
    print("Please enter sulfate or nitrate")
    return
  }
 print(my_mean)
#   
# #  print( mean(my_sum))
  
  
  
}

