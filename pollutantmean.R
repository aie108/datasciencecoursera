pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  ## directory <- paste("./", directory, "/", sep = "")
  
  ## for(k in seq_along(id)) {
    ## Prepare the fileName
    ## num <- formatC(id, width = 3, flag = "0")
    ## fileName <- paste(directory, num, ".csv", sep = "")
    
    ## Read data from fileName along id
    ## data_file <- read.csv(file = fileName, header = TRUE)
    
    ## Read on non-NA data
    ## data <- data_files[!is.na(data_files[pollutant]), pollutant]
    
    ## Add non-NA data to the dataset
    ## 
  ## }
  
  ## init data_files
  
  
#   files <- list.files(directory)
#   for(num in id) {
#     data_files <<- rbind(
#       data.frame(
#         read.csv(
#           paste(directory, files[id], sep = ""), 
#           header = TRUE)))
#   }
#   
#   data_nonNA <- data_files[!is.na(data_files[pollutant]), pollutant]
  
  files <- list.files(paste("./", directory, "/", sep = ""))
  data_files <- lapply(paste("./", directory, "/", files[id], sep = ""), read.csv, header=T)

  data_all <- NA
  
  num <- 1
  for(i in id) {
    data <- data_files[[num]]
    data_pollutant <- data[pollutant]
    data_all <- append(data_pollutant[[1]], data_all)
    num <- num + 1
  }
  
  data_nonNA <- data_all[!is.na(data_all)]
  
  mean(data_nonNA)
}