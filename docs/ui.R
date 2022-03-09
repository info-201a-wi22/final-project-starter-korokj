library(shiny)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(plotly)

ui <- fluidPage(
                navbarPage("OD-US",
                  tabPanel("Introduction",
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("Paragraph")
                           ) # mainPanel
                           
                  ), # Navbar 1, tabPanel
                  tabPanel("1st Chart", 
                           sidebarPanel(
                             tags$h3("Filter:"),
                             selectInput("ethchoice", "Ethnicity:", 
                                         c("All" = "All persons", 
                                           "African-American: Male" = "Male: Black or African American",
                                           "African-American: Female" = "Female: Black or African American",
                                           "White: Male" = "Male: White",
                                           "White: Female" = "Female: White",
                                           "American Indian/Alaskan Native: Male" = "Male: American Indian or Alaska Native",
                                           "American Indian/Alaskan Native: Female" = "Female: American Indian or Alaska Native",
                                           "Asian/Pacific Islander: Male" = "Male: Asian or Pacific Islander",
                                           "Asian/Pacific Islander: Female" = "Female: Asian or Pacific Islander",
                                           "Male: Hispanic or Latino" = "Male: Hispanic or Latino: All races",
                                           "Female: Hispanic or Latino" = "Female: Hispanic or Latino: All races")),
                             sliderInput("year", "Year:", min = 1999, max = 2018,
                                         value = c(1999,2018), sep = "")
                           ),
                           mainPanel(
                             h1("U.S. Drug Overdose Death Rate per 100,000 People"),
                             
                             h4(textOutput("text")),
                             plotlyOutput("test"),
                             
                           )),
                  tabPanel("2nd Chart",
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Given Name:", ""),
                             textInput("txt2", "Surname:", "")
                           ),
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("Output 1"),
                             verbatimTextOutput("txtout"),
                             
                           ) # mainPanel
                  ),
                  tabPanel("3rd Chart", 
                           sidebarPanel(
                             tags$h3("Input:"),
                             textInput("txt1", "Given Name:", ""),
                             textInput("txt2", "Surname:", "")
                           ),
                           mainPanel(
                             h1("Header 1"),
                             
                             h4("Output 1")
                             
                           ))
                  
                ) # navbarPage
) # fluidPage
