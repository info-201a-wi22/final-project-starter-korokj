library(gt)
library(tidyverse)
library(dplyr)
library(zoo)
library(gtsummary)

drug_data <- read.csv(file = "https://data.cdc.gov/api/views/xkb8-kh2a/rows.csv?accessType=DOWNLOAD&bom=true&format=true")
View(drug_data)
drug_data <- data.frame(drug_data)
drug_data$Date <- paste(drug_data$Month, drug_data$Year)
drug_data$Date <- as.yearmon(drug_data$Date, '%B %Y')
drug_data <- arrange(drug_data, Date)
drug_data$Data.Value <- as.numeric(sub(",", "", unlist(drug_data$Data.Value, use.names=FALSE)))


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
    title = md("Overdose `Deaths` in Most Affected States"),
    subtitle = md("(Includes **Nationwide** Death Count)")
  ) %>%
  opt_align_table_header(align = 'left') %>%
  cols_label(
    State.Name = md("*State*"),
    Data.Value = md("*Deaths*"),
  ) %>%
  fmt_number(columns = 'Data.Value', decimals = 0) %>%
  tab_source_note(source_note = "Dataset is from the CDC's Provisional 
                  Monthly National and State-Level 
                  Drug Overdose Death Counts.") %>%
  tab_source_note(source_note = "The reported
                  provisional counts represent the numbers of deaths due 
                  to drug overdose occurring in the 12-month periods ending 
                  in January of the year indicated.") %>%
  cols_align(columns = 1, align = 'center') %>%
  opt_table_font(font = "Helvetica")

the_table 