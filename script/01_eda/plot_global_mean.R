mean_line_plot <- function(data){
  
  # Funzione per creare un grafico per ogni variabile
  plot_variable <- function(variable_name, data) {
    data %>%
      filter(variable == variable_name) %>%
      select(-country, -city, -variable, -lat, -lon) %>% # Escludi le colonne non necessarie
      pivot_longer(
        cols = everything(), # Seleziona tutte le colonne rimaste per il pivot
        names_to = "year",
        values_to = "value"
      ) %>%
      group_by(year) %>%
      summarise(mean_value = mean(value, na.rm = TRUE)) %>%
      ggplot(aes(x = as.numeric(year), y = mean_value)) +
      geom_line(color = "#006400") + # Verde scuro
      geom_point(color = "#006400") + # Verde scuro
      scale_x_continuous(breaks = 2009:2019, limits = c(2009, 2019)) + # Imposta gli anni sull'asse X
      labs(title = variable_name, x = "Year", y = "Value") +
      theme_minimal(base_size = 12) + # Sfondo bianco con griglia minima
      theme(panel.background = element_rect(fill = "white", colour = "white")) # Imposta lo sfondo del pannello a bianco
  }
  
  # Lista delle variabili uniche
  variables <- unique(data$variable)
  
  # Crea un grafico per ogni variabile
  for (v in variables) {
    print(plot_variable(v, data))
  }
}
