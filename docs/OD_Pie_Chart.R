library("rstudioapi")
library("ggplot2")
library("tidyverse")
library("zoo")
getwd()
source("suminfo.R")
source("table.R")

df_for_opiates <- drug_data %>%
  filter(Month == "January") %>%
  filter(State.Name == "United States") %>%
  filter(Indicator == "Opioids (T40.0-T40.4,T40.6)")

df_for_stim <- drug_data %>%
  filter(Month == "January") %>%
  filter(State.Name == "United States") %>%
  filter(Indicator == "Psychostimulants with abuse potential (T43.6)")

df_for_heroin <- drug_data %>%
  filter(Month == "January") %>%
  filter(State.Name == "United States") %>%
  filter(Indicator == "Heroin (T40.1)")

df_for_cocaine <- drug_data %>%
  filter(Month == "January") %>%
  filter(State.Name == "United States") %>%
  filter(Indicator == "Cocaine (T40.5)")



opiate_sum = sum(df_for_opiates$Data.Value)
stim_sum = sum(df_for_stim$Data.Value)
heroin_sum = sum(df_for_heroin$Data.Value)
cocaine_sum = sum(df_for_cocaine$Data.Value)

slices <- c(opiate_sum, stim_sum, heroin_sum, cocaine_sum)
lbls <- c("Opioids", "Psychostimulants", "Heroin", "Cocaine")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) 
lbls <- paste(lbls,"%",sep="") 
pie1 <- pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Overdose Deaths by Drug Type")
pie1




