corr <- function(directory, threshold = 0) {
  ## data_files
  files <- list.files(paste("./", directory, "/", sep = ""))
  #data_files <- lapply(paste("./", directory, "/", files, sep = ""), read.csv, header=T)
  
  ## init data.frame to collect all nonNA data
  df_complete = data.frame(Date=NA, sulfate=NA, nitrate=NA, ID=NA)[numeric(0),]
  
  num = 1
  x <- numeric(0)
  for(i in seq_along(files)) {
    contents = read.csv(paste("./", directory, "/", files[i], sep = ""))
    
    ## create complete_data for nonNA contents
    complete_data = contents[complete.cases(contents),]
    if(nrow(complete_data) > threshold) {
      ans = cor(complete_data$sulfate, complete_data$nitrate)
      x = append(x, ans)
    }
    num = num + 1
  }

  ## return correlation vector
  x
}