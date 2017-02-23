corr <- function(directory, threshold = 0){
     
     # for str_pad
     library(stringr)
     
     # get dataframe with all number of completed observations
     obs_df <- complete(directory)
     
     # get a vector of id with data meet the given threshold
     ids <- obs_df[ obs_df["nobs"]> threshold, ][["id"]]

     # result vector index
     ind <- 1
     
     # result vector
     cor_res <- vector(mode = "numeric", length = length(ids))
     
     for(i in ids){
          
          # build full path
          fullpath <- paste(directory, "/", str_pad(i, 3, pad = "0"), ".csv", sep = "")
          
          # read csv file
          cur_df <- read.csv(fullpath)
          
          #fill in the result
          cor_res[ind] <- cor(cur_df["sulfate"], cur_df["nitrate"], use = "complete.obs")

          # Increase index
          ind <- ind + 1
     }
     
     cor_res
     
}
