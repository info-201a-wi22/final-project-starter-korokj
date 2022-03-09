library(shiny)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(plotly)

# Define server function  
server <- function(input, output) {
  df1 <- read.csv("https://data.cdc.gov/api/views/95ax-ymtc/rows.csv?accessType=DOWNLOAD")
    
  reactive_df1 <- reactive({
    filtered_df1 <- df1 %>%
      filter(YEAR >= input$year[1] & YEAR <= input$year[2]) %>%
      filter(STUB_LABEL == input$ethchoice)
    
  })
  
  output$text <- renderText({input$ethchoice})
  
  output$test <- renderPlotly({
    plot_ly(reactive_df1(), x = ~YEAR, y = ~ESTIMATE, color = ~PANEL, type = 'scatter',
            mode = 'lines+markers')
    
  })
  
  
  source("suminfo.R")
  
  filtered_df2 <- drug_data %>%
    filter(Indicator == 'Number of Drug Overdose Deaths') %>%
    filter(Month == 'January') %>%
    filter(State.Name != 'United States')
    
  reactive_df2 <- reactive({
    filtered_df2 %>%
      filter(Year == input$date_from[1])
  })
  
  output$chart <- renderPlotly({
    
    plot_ly(reactive_df2(), x = ~State.Name, y =~Data.Value, type = 'bar', name = '# of overdose deaths') %>% layout(title = 'Overdose Deaths by State', xaxis = list(title = 'State'), yaxis = list(title = '# of overdose deaths'))
          
          })
}
    

 # server