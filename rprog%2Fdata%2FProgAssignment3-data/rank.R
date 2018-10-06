helper <- function(data, col_num, state) {
  state_subset <- data[data[, 7]==state, ]
  outcome_arr <- state_subset[, col_num]
  min <- min(outcome_arr, na.rm=T)
  min_index <- which(outcome_arr == min)
  hosp_name <- state_subset[min_index, 2]
  return(hosp_name)
}

best <- function(state, outcome) {
 
  #directory <- "outcome-of-care-measures.csv"
  data <- read.csv("outcome-of-care-measures.csv", colClasses="character")
  data[, 11] <- as.numeric(data[, 11]) # heart attack
  data[, 17] <- as.numeric(data[, 17]) # heart failure
  data[, 23] <- as.numeric(data[, 23]) # pneumonia
  valid_outcomes <- c("heart attack", "heart failure", "pneumonia")
  if (!state %in% data$State) {
    stop("invalid state")
  } else if(!outcome %in% valid_outcomes) {
    stop("invalid outcome")
  } else {
    if(outcome == "heart attack") {
      hosp_name <- helper(data, 11, state)
    } else if(outcome == "heart failure") {
      hosp_name <- helper(data, 17, state)
    } else {
      hosp_name <- helper(data, 23, state)
    }
    result <- hosp_name
    return(result)
  }
}
