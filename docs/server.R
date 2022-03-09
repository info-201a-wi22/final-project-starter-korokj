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
  
  reactive_df3 <- reactive ({
    filtered_df3 <- drug_data %>%
      filter(Indicator == 'Number of Drug Overdose Deaths') %>%
      filter(Month == 'January') %>%
      filter(Year == '2021') %>%
      filter(State.Name %in% input$choose_state)
  })
  
  output$chart3 <- renderPlotly({
    plot_ly(reactive_df3(), x = ~State.Name, y =~Data.Value, type = 'bar', name = '# of overdose deaths') %>% 
      layout(xaxis = list(title = 'State'), yaxis = list(title = '# of overdose deaths'))
  })
  
  output$table1 <- renderTable({
    df_for_table <- drug_data %>%
      filter(Indicator == 'Number of Drug Overdose Deaths') %>%
      filter(Month == 'January') %>%
      filter(State.Name == 'California' | State.Name == 'Florida' |
               State.Name == 'Ohio' | State.Name ==  'Pennsylvania'|
               State.Name == 'United States') %>%
      subset(select = c('State.Name', 'Year', 'Data.Value'))
    the_table <- df_for_table %>%
      group_by(Year) %>%
      gt() %>%
      tab_header(
        title = ("Overdose `Deaths` in Most Affected States"),
        subtitle = ("(Includes **Nationwide** Death Count)")
      ) %>%
      opt_align_table_header(align = 'left') %>%
      cols_label(
        State.Name = "State",
        Data.Value = "Deaths",
      ) %>%
      tab_source_note(source_note = "Dataset is from the CDC's Provisional 
                  Monthly National and State-Level 
                  Drug Overdose Death Counts.") %>%
      tab_source_note(source_note = "The reported
                  provisional counts represent the numbers of deaths due 
                  to drug overdose occurring in the 12-month periods ending 
                  in January of the year indicated.") %>%
      cols_align(columns = 1, align = 'center') %>%
      opt_table_font(font = "Helvetica")
  })
}
    

 # server