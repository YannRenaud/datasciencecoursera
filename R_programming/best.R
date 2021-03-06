best <- function(state, outcome) {
     
     library('dplyr')
     
     # Chemin d'acc�s aux fichiers
     home_path <- "C:/Users/g82273/Documents/R/Coursera/Dataset/week4/"
     #home_path <- "/home/yann/Documents/R_Programming/rprog_data_ProgAssignment3-data/"
     
     ## Vector of deseases with column number for death rate
     deseases <- c(11, 17, 23)
     names(deseases) <- c("heart attack", "heart failure", "pneumonia")
     
     ## Read outcome data
     outcome_df <- read.csv(paste(home_path, "outcome-of-care-measures.csv", sep = ""), colClasses = "character", na.strings="Not Available" , stringsAsFactors=FALSE)

     ## Check that state and outcome are valid
     state_ok <- state %in% outcome_df$State
     if(!state_ok) stop("invalid state")
     
     outcome_col <- deseases[outcome]
     if(is.na(outcome_col)) stop("invalid outcome")

     ## work with simplified dataframe
     outcome_s <- outcome_df[c(2, 7, outcome_col)]
     colnames(outcome_s) <- c("hospital", "us_state", "rate")

     ## Convert outcome column in numeric
     outcome_s$rate <- as.numeric(outcome_s$rate)
     
     # Get the result using Dplyr (filter on state and rate not NA, then summarise with min function on the rate )
     result <- outcome_s %>% 
                    filter(us_state == state & rate != 'NA') %>%
                    filter(rate == min(rate))
     
     result$hospital
     
}