pollutantmean <- function(directory, polluant, id= 1:332){
     
     # for str_pad
     library(stringr)
     
     # means 
     means <- vector(mode = "numeric", length = length(id))
     
     #mean index
     ind <- 1
     
     
     for (i in id){
          
          # build full path
          fullpath <- paste(directory, "/", str_pad(i, 3, pad = "0"), ".csv", sep = "")

          # read csv file
          cur_df <- read.csv(fullpath)
          print(fullpath)
          #calculate the mean
          cur_mean <- mean(cur_df[[polluant]], na.rm = TRUE)
          if(is.nan(cur_mean)) {
               means[i] <- 0
               
          }
          else{
               means[i] <- cur_mean
          }
          #print(i)
          #print(mean(cur_df[[polluant]], na.rm = TRUE) )
          
          # Increase index
          ind <- ind + 1
     }
     
     # return the global mean
     mean(means)
     
     
}
