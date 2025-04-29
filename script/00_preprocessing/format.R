library(tidyr)
format_dataset <- function(dataset){
  if (!requireNamespace("tidyr", quietly = TRUE)) {
    install.packages("tidyr")
  }
  
  wide_dataset <- pivot_wider(dataset, 
                              id_cols = c("Country", "Geography", "Variable"), 
                              names_from = "Time", 
                              values_from = "Value")
  
  wide_dataset <- wide_dataset[order(wide_dataset$Variable, wide_dataset$Country), ]
  
  names(wide_dataset)[names(wide_dataset) == "Geography"] <- "City"
  wide_dataset
}