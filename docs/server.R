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
  

} # server