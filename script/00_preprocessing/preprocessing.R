count_nan <- function(df){
  nan_counts_df <- data.frame(Column = character(), NaN_Count = numeric(), stringsAsFactors = FALSE)
  
  # Count the number of NaN values in each column and store the results
  for (col in names(df)) {
    print(col)
    nan_count <- sum(is.na(df[[col]]))
    print(nan_count)
    nan_counts_df <- rbind(nan_counts_df, data.frame(Column = col, NaN_Count = nan_count))
  }
  
  nan_counts_df
}

year_selection <- function(df){
  columns_to_remove <- c("2001", "2002", "2003", "2004", "2005", "2006", "2007", "2008", "2020", "2021", "2022")
  
  # Remove columns from the data frame
  df1 <- df[, !names(df) %in% columns_to_remove]
  df1
}

change_col_names <- function(df){
  colnames(df)[1:3] <- c("country", "city", "variable")
  df
}