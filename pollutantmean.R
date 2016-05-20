pollutantmean <- function( directory, pollutant, id  = 1:332){
  ## directory is the path to the files.  
  col_names <- c("Date","sulfate","nitrate","ID")
  files_to_read <- list.files(directory, full.names = TRUE)
  data_to_process <- 0
  my_mean <- 0
  
  poll <- list(pollutant)
  ## we now have a vector.  we will read the files
  ## requested by the user. 
  index_of_data <- lapply(files_to_read[id], function(index){
    
    data_to_process <- read.csv(index, header = TRUE, col.names = col_names )
    
  })
  
  ## Not very elegant...there is a better way to 
  ## handle this.  
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
  
  
  
  
}
