# Chart 3

# Load necessary packages (`dplyr`, `ggplot2`, and `plotly`)
library("dplyr")
library("ggplot2")
library("plotly")



# filter drug data by number of drug overdose deaths, 2021, include each state except the entire United States
# Stacked Bar Chart 
df_for_chart3 <- drug_data %>%
  filter(Indicator == 'Number of Drug Overdose Deaths') %>%
  filter(Month == 'January') %>%
  filter(Year == '2021') %>%
  filter(State.Name != 'United States')

chart3 <- plot_ly(df_for_chart3, x = ~State.Name, y =~Data.Value, type = 'bar', name = '# of overdose deaths') %>% layout(title = 'Overdose Deaths by State in 2021', xaxis = list(title = 'State'), yaxis = list(title = '# of overdose deaths'))
chart3
 
# This chart was made to identify which locations within the U.S. have the highest number of drug overdoses.
# California and Florida have by far the most overdose deaths in 2021 with over 6,000 each, followed by Ohio, Pennsylvania, and Texas.
# The difference between Florida and Georgia in annual drug overdose deaths in 2021 is nearly 5,000, 
# making Georgia's overdose deaths in 2021 about a quarter of Florida's overdose deaths for that same year.
# This indicates that there are states with far more drug overdose deaths than other locations.