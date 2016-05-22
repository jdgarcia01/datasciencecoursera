## Test of complete cases. 

complete2 <- function(directory, id = 1:332){
  
  
  current_fiule <- list.files("/homes/alexander/prog/r/data/specdata", full.names = TRUE)
  
  file <- read.csv("/home/alexander/prog/r/data/specdata/001.csv", header=T, sep=",")
  ## looks like complete cases returns TRUE or FALSE.
  complete_data <- sum(complete.cases(file))
  
 complete_data
  
  
  
  
  
  
}