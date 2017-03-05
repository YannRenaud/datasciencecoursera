rankall <- function(outcome, num = "best") {

     library('dplyr')
     
     ## Deal with num argument
     if(num == 'best') num <- 1
     
     # Chemin d'accès aux fichiers
     home_path <- "C:/Users/g82273/Documents/R/Coursera/Dataset/week4/"
     #home_path <- "/home/yann/Documents/R_Programming/rprog_data_ProgAssignment3-data/"
     
     ## Vector of deseases with column number for death rate
     deseases <- c(11, 17, 23)
     names(deseases) <- c("heart attack", "heart failure", "pneumonia")
     
     ## Read outcome data
     outcome_df <- read.csv(paste(home_path, "outcome-of-care-measures.csv", sep = ""), colClasses = "character", na.strings="Not Available" , stringsAsFactors=FALSE)
     
     ## Check that outcome is valid
     outcome_col <- deseases[outcome]
     if(is.na(outcome_col)) stop("invalid outcome")
     
     ## work with simplified dataframe
     outcome_s <- outcome_df[c(2, 7, outcome_col)]
     colnames(outcome_s) <- c("hospital", "us_state", "rate")
     
     # exclude na values
     outcome_s <- outcome_s[!(is.na(outcome_s$rate)),]
     
     ## Convert outcome column in numeric
     outcome_s$rate <- as.numeric(outcome_s$rate)
     
     ## Return hospital name in that state with the given rank
     sorted <- outcome_s %>% 
                    arrange(us_state, rate, hospital) %>%
                    group_by(us_state)
     
     # Split the list by state
     splited <- split(sorted, sorted$us_state)

     # Pick only the hostipal wanted for each state (worst pick the last one)
     if (num == 'worst') res_temp <- sapply(splited, function(x) x$hospital[nrow(x)]) else res_temp <- sapply(splited, function(x) x$hospital[num])

     # Build the result data frame
     result <- data.frame(hospital=as.vector(res_temp[]), state=names(res_temp), row.names=names(res_temp))
     
     ## 30-day death rate
     result
     
}