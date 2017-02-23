complete <- function(directory, id= 1:332){
     
     # for str_pad
     library(stringr)
     
     # dataframe of result 
     res_df <- data.frame(id = id, nobs = 0)
     
     # dataframe index
     ind <- 1
     
     for (i in id){
          
          # build full path
          fullpath <- paste(directory, "/", str_pad(i, 3, pad = "0"), ".csv", sep = "")
          
          # read csv file
          cur_df <- read.csv(fullpath)
          
          # sum of sulfate + nitrate
          sum_obs <- cur_df[["sulfate"]] + cur_df[["nitrate"]]
          
          res_df[ind, 1] <- i
          res_df[ind, 2] <- (length(which(!is.na(sum_obs))))
          
          # Increase index
          ind <- ind + 1
     }
     
     # return the result dataframe
     res_df
     
     
}
