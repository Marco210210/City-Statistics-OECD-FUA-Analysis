split_dataset <- function(dataset){
  unique_values <- unique(dataset$variable)
  
  # Creiamo un elenco di dataframe separati, uno per ciascun valore unico in "variables"
  dataframe_list <- lapply(unique_values, function(var) {
    subset_df <- dataset[dataset$variable == var, ]
    return(subset_df)
  })
  
  for(i in 1:length(unique_values)){
      unique_values[[i]]=switch(unique_values[[i]],
             "GDP (Million USD, constant prices, constant PPP, base year 2015)" = "GDP",
             "GDP per capita (USD, constant prices, constant PPP, base year 2015)" = "GDP_per_capita",
             "Labour force (15-64 years old)" = "Labour_force",
             "Mean population exposure to PM2.5 air pollution" = "Pollution",
             "Population density (inhabitants per km²)" = "Population_density",
             "Population, all ages, administrative data" = "Total_population",
             "Unemployment rate (unemployment 15-64 over labour force 15-64)" = "Unemployment_rate",
      )
    
    save_dataset(dataframe_list[[i]], unique_values[[i]])
  }
  
  dataframe_list
}

save_dataset <- function(dataset, name){
  path <- paste(paste("dataset",name,sep="/"),"csv",sep=".")
  write.csv(dataset, path, row.names = FALSE)
}

