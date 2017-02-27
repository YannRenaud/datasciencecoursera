best <- function(state, outcome) {

    ## Vector of deseases with column number for death rate
    deseases <- c(11, 17, 23)
    names(deseases) <- c("heart attack", "heart failure", "pneumonia")
    
    ## Read outcome data
    outcome_df <- read.csv("/home/yann/Documents/R_Programming/rprog_data_ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    
    ## Check that state and outcome are valid
    state_ok <- state %in% outcome_df$State
    if(!state_ok) stop("invalid state")
    
    #deseases <- list("heart attack", "heart failure", "pneumonia")
    #outcome_ok <- outcome %in% deseases
    #if(!outcome_ok) stop("invalid outcome")
    
    # Check the validity of the outcomes and set the correct dataframe column
    #switch(outcome, 
    #       "heart attack"= col_df = 11,
    #       "heart failure"= col_df= 17,
    #       "pneumonia"= col_df= 23,
    #       stop("invalid outcome")
    #)
    
    outcome_col <- deseases[outcome]
    if(is.na(outcome_col)) stop("invalid outcome")
    
    ## Return hospital name in that state with lowest 30-day death
    better_by_state <- lapply(s, function(x) min(as.numeric(x[ ,deseases["heart attack"]])))
    transform(outcome_df, State.rank = ave(11, State,FUN = function(x) rank(-x, ties.method = "first")))
    
    ## rate
    
}
