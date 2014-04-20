complete <- function(directory, id=1:332) {
  ## data_files
  files <- list.files(paste("./", directory, "/", sep = ""))
  data_files <- lapply(paste("./", directory, "/", files[id], sep = ""), read.csv, header=T)
  
  ## init data.frame
  myData = data.frame(id=NA, nobs=NA)[numeric(0),]
  
  num <- 1
  for(i in id) {
    data <- data_files[[num]]
    complete_row  <- nrow(na.omit(data))
    
    record <- c(i, complete_row)
    myData = rbind(myData, record)

    num <- num + 1
  }
  
  colnames(myData) <- c("id", "nobs")
  myData
}