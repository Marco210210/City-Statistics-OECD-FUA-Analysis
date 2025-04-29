#install.packages("leaflet")

library(leaflet)

plot_world <- function(dataset, variable, colname){
  pal <- colorNumeric(
    #c("#eef614", "#ffcb3c", "#ff8902", "#f54d00", "#eb0400"),
    c("#743BFF","#21F3B9", "#21F340", "#FFEB3B","#FF513B"),
    domain = dataset[[colname]]
  )
  # Assuming 'cities' is your dataset with columns 'lat', 'lon', and 'population'
  # Adjust the column names accordingly
  dataset <- dataset[order(dataset[[colname]]),]
  # Create a leaflet map
  m <- leaflet(data = dataset) %>%
    addTiles() %>%
    addCircleMarkers(
      data = dataset,
      color = ~pal(dataset[[colname]]),
      label = paste(dataset$city, dataset[[colname]], sep=":"),
      lng = ~lon,
      lat = ~lat,
      radius = ~sqrt(dataset[[colname]]) * 0.0015,  # Adjust the multiplier based on your data
      fillOpacity = 0.4,
      popup = ~paste(variable,":", dataset[[colname]])
    ) %>%
    addLegend(data = dataset,
              pal = pal,
              values = ~dataset[[colname]],
              position = "bottomleft",
              title = paste(variable," (",colname,")", sep=""),
              opacity = 0.9)
  
  # Print the map
  print(m)
  m
}
