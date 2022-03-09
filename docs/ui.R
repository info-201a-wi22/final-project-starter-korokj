library(shiny)
library(shinythemes)
library(dplyr)
library(ggplot2)
library(plotly)

ui <- fluidPage(
  tags$head(
    tags$style(HTML("
                          @import url('https://fonts.googleapis.com/css2?family=Smooch+Sans:wght@100&display=swap');
                          body {
                            background-color: black;
                            color: white;
                          }
                          h2 {
                            font-family: 'Smooch Sans', sans-serif;
                          }
                          
                          .shiny-input-container {
                            color: #474747;
                            
                          }"))
    
    
  ),
  navbarPage("OD-US",
             tabPanel("Introduction",
                      mainPanel(
                        titlePanel("Introduction"),
                        
                        p("Overdose deaths in the United States 
                          have been rapidly increasing on an unprecedented
                          high throughout the past few decades. Thousands
                          of Americans are impacted by drug abuse every 
                          day, and the prevalence of these substances are
                          only growing, along with their influence on the
                          daily lives of innocent people. The purpose of 
                          our project seeks to identify the multitude of 
                          variables that are inciting this phenomenon. 
                          Specifically, we are examining the trends of drug
                          overdose across the states and years and finding 
                          their relationship to drug overdose deaths. We are
                          also concerned with identifying prominent types of 
                          drugs associated with drug overdose and the states 
                          that are impacted the most by them. To execute our 
                          project, we will be utilizing the 12 Month-ending 
                          Provisional Number of Drug Overdose Deaths dataset 
                          by the CDC (Centers for Disease Control and Prevention).
                          The mortality data is pulled from the National Vital
                          Statistics System. The deaths are counted throughout all
                          50 states, including the District of Columbia. A second
                          dataset we also used was the VSRR Provisional Drug Overdose
                          Death Counts afforded by the cdc.gov website. We hope that
                          our project helps educate Americans on the prevalence of
                          drug overdose, and informs them about which areas of the 
                          country are at the highest risk. Ultimately, the purpose of
                          our project is to spread awareness of the dangers of drug 
                          overdose and inform a better future for the citizens of the 
                          United States of America."),
                        HTML('<p><img src="opioid.jpeg"/></p>')
                      ) # mainPanel
                      
             ), # Navbar 1, tabPanel
             tabPanel("1st Chart", 
                      sidebarPanel(
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
                        titlePanel("U.S. Drug Overdose Death Rate per 100,000 People"),
                        
                        h4(textOutput("text")),
                        plotlyOutput("test")
                        
                      )),
             tabPanel("2nd Chart",
                      sidebarPanel(
                        selectInput(
                          inputId =  "date_from", 
                          label = "Select time period:", 
                          choices = 2015:2021
                        )
                      ),
                      mainPanel(
                        plotlyOutput("chart")
                        
                      ) # mainPanel
             ),
             tabPanel("3rd Chart", 
                      sidebarPanel(
                        checkboxGroupInput(inputId = "choose_state", "Choose States",
                                           list("Alabama", "Alaska", "Arizona",
                                                "Arkansas", "California", "Colorado",
                                                "Connecticut", "Delaware", "District of Columbia",
                                                "Florida", "Georgia", "Hawaii", "Idaho", "Illinois",
                                                "Indiana", "Iowa", "Kansas", "Kentucky", "Louisiana",
                                                "Maine", "Maryland", "Massachusetts", "Michigan", "Minnesota",
                                                "Mississippi", "Missouri", "Montana", "Nebraska", "Nevada",
                                                "New Hampshire", "New Jersey", "New Mexico", "New York", "New York City",
                                                "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania", "Rhode Island",
                                                "South Carolina", "South Dakota", "Tennessee", "Texas", "Utah", "Vermont",
                                                "Virginia", "Washington", "West Virginia", "Wisconsin", "Wyoming"))
                      ),
                      mainPanel(
                        titlePanel("Compare Overdose Deaths by State"),
                        
                        h4("(Data from Jan. 2020 - Jan. 2021)"),
                        
                        plotlyOutput("chart3")
                        
                      )),
             tabPanel("Summary Takeaways",
                      mainPanel(
                        titlePanel("Our Takeaways from this Project"),
                        h4("Takeaway #1: Surprising Results Found in State Numbers"),
                        p("The first shocking revelation we made while ciphering thru 
                      these datasets was where the most overdoses are occurring. 
                      According to our research, the following states are currently 
                      seeing the most worrying uptick in overdose deaths: California, 
                      Florida, Ohio, and Pennsylvania. While California and Florida 
                      are expected due to their high population, Ohio and Pennsylvania 
                      surprised us. It turns out the opioid epidemic has hit these states 
                      the hardest, and Ohio and Pennsylvania have a drug-related mortality 
                      rate of 47.2 and 42.4, respectively. The trend they're heading towards 
                      is problematic, and they are not far off from their highly populated 
                      counterparts in total deaths. (Table below)."),
                        tableOutput("table1"),
                        h4("Takeaway #2: Males of all Ethnicities are Disproportionately Affected"),
                        p("While it is true that everyone is affected by the opiate epidemic, males 
                      seem to be hit the hardest. As of 2018, African-American males had an overdose 
                      death rate of 31.5 (per 100,000 people), and White males were 30.1; juxtapose 
                      this data with 11.1 for African-American females and 15.2 for White females. The
                      reasons for this can be debated, but males are at a much higher risk of death when
                      using drugs. Unfortunately, the numbers have only gone up since ~2010. (See Chart 1)"),
                        h4("Takeaway #3: Synthetic Opioids are the Biggest Problem"),
                        p("One of the biggest takeaways was the imposing up spike in synthetic opioid deaths. 
                      Since 2015-2016, synthetic opioids have been the biggest proponent of opioid overdoses. 
                      We can relay most of this to the overwhelming amount of fentanyl found throughout the 
                      country. Heroin is the second biggest killer among the various categories of opioids, but
                      its body count is roughly half that of synthetic opioids.")
                      )),
             tabPanel("Report",
                      mainPanel(
                        
                        titlePanel("P03: Report"),
                        h1("Examining Drug Overdoses in the U.S."),
                        h3("Code Name:"),
                        p("US-OD"),
                        h3("Project title:"),
                        p("Examining Drug Overdoses in the U.S."),
                        h3("Authors:"),
                        p("Joseph Koroki: korokj@uw.edu Cameron Rezek: jcrezek@uw.edu Soneta Un: sone5@uw.edu"),
                        h3("Affiliation:"),
                        p("INFO-201: Technical Foundations of Informatics - The Information School - University of Washington"),
                        h3("Date:"),
                        p("Winter 2022 02/04/2022"),
                        h3("Abstract:"),
                        p("Our main question is what is the solution to the rising drug overdose deaths in the U.S.? This is 
                        important because drug overdosing has been a key issue in the U.S. since the 1970s. To address this 
                        concern, we will look at the variables associated with drug overdose deaths."),
                        h3("Keywords:"),
                        p("overdose deaths in the U.S. data; drug abuse; effects of drugs on the human physiology; symptoms and
                        side effects; drug laws and legislation"),
                        h3("1.0 Introduction:"),
                        p("Overdose deaths in the United States are at an all-time high, continuing an unprecedented trend that
                        has only gone up in the past few decades. Many variables spur it, and much of the blame falls on the 
                        increasing popularity of opiates within the country. Our project aims to examine the data collected on
                        overdose deaths stemming from using all different kinds of drugs. Specifically, we want to look for trends
                        within states and years and find a relevant correlation between the two. We hope that our project helps educate
                        Americans on the rising numbers of overdose deaths and inform them what areas of the country are at the highest
                        risk. Through careful analysis, we also want to look for tendencies amongst the data, such as what drugs are affecting
                        which cities the most severely. Ultimately, our team chose this topic to spread awareness of the dangers of certain 
                        drugs and shine a light on the path the United States is heading toward."),
                        h3("Design Situation:"),
                        p("Framing the Topic of Concern: The topic of concern we are addressing in our data science project is deaths within the 
                      U.S. caused by drug overdose. Key elements within this topic are what drugs are being used within the substance abuse epidemic,
                      how the usage of drugs affects the dichotomy of society and the people living within it, what we can learn about the power and 
                      influence of substance abuse, and how this issue is addressed. The key scientific issues are the impact drugs have on human physiology
                      and rapidly decreasing life spans, including death. A social issue concerning drugs is the demographic of people it may be harming, and 
                      how this may put them at a great disadvantage compared to others who may not be experiencing the repercussions of drug usage. An economic 
                      issue would be how the vast and high-in-demand drug business affects markets. A governmental issue would be how legislation addresses the 
                      legalization of drugs in U.S. states, and how it takes action against the overdose crisis.

                      Human Values: Human values that are connected to our topic of drug overdose would be empathy, equality, respect, and the appreciation and value
                      of human life. Oftentimes the issue of drug usage is overlooked or ignored, which is the equivalent of turning a blind-eye to those who are 
                      suffering from substance abuse. Many believe that individuals who put themselves in a critical state of need from taking drugs are at fault for 
                      putting themselves in that position, and earn no sympathy. However, this human value of responsibility for one's own actions completely neglects 
                      taking action for those who need it most and empathizing with the conflicts that brought them there.

                    Stakeholders: Direct stakeholders of substance abuse within the U.S. would be individuals who partake in the usage of drugs or those you have overdosed. 
                    Indirect stakeholders would be policy makers, designers and engineers that develop products and solutions to drug abuse, researchers, clinicians and family 
                    members of those who have loved ones experiencing drug abuse.

                    Benefits and Harms: The potential harm that comes from interventions taken with data and technology, is that some datasets may be inaccurate or do not have
                        enough data to be considered reliable or conclusive. Potential benefits, however, would be that a well-developed solution could help countless people 
                        suffering from drug abuse. Stakeholders that are likely to benefit from these solutions would be family members, patients, victims, designers, engineers, 
                        clinicians, and researchers. These stakeholders are also likely to be harmed by a misinformed solution. An unanticipated consequence might be public outrage 
                        due to a restriction on drugs."),
                        h3("3.0 Research Questions:"),
                        p("What specific drugs are the most responsible for death caused by drug overdose?
                        Which demographic is the most affected by drug overdose/abuse?
                        Which locations within the U.S. have the highest number of drug overdoses?
                        What solutions have been invented to prevent the increase of drug overdose?
                        What drugs run a higher risk of overdose and death? Why? The five questions 
                        mentioned above pose questions about information that would be essential in
                        understanding drug overdose and how to combat it. Learning what drugs cause 
                        the most deaths or are more likely to incite overdose, either due to addictive 
                        properties, accessibility, or other factors would be critical in the development 
                        of solutions to address this situation. Also, recognizing what demographics and 
                        in what location these drugs are affecting the most will help us understand why 
                        drug overdose occurs and how it can be prevented."),
                        h3("4.0 The Dataset:"),
                        p("https://www.cdc.gov/nchs/nvss/vsrr/drug-overdose-data.htm#data-tables Nrow: 44695 Ncol: 
                      12 Overdose deaths throughout the US are accounted for and broken down by state and month.
                      The mortality data is pulled from the National Vital Statistics System. The deaths are counted 
                      throughout all 50 states, including the District of Columbia. The observation in this instance
                      would be a specific state (broken down by month).

                      The data goes beyond just the number of overdose deaths: it also includes what drug caused the 
                      overdose if that data is available. The number of fatalities, type of drug, the year, and the 
                      month would all be considered variables. The CDC conducts case surveillance through the National
                      Notifiable Diseases Surveillance System, which works with over 3,000 health departments. This data 
                      set was recorded from the beginning of 2015 thru 2021. The CDC's goal from collecting this data is 
                      to protect and preserve their local communities. The CDC acquires its funding by annual appropriations
                      determined by the U.S. Congress and charitable donations. Data collection is paramount to protecting 
                      the public's safety and health. Their validation efforts are internal and subject to auditing and validation
                      by external agencies, which upholds the quality of the data. Data is held secure with Federal Information 
                      Processing Standard (FIPS) encryption. CDC's efforts to increase credibility and trustworthiness with the
                      public are well documented, and there is a section on their site that showcases all their peer reviews. Our
                      particular dataset includes a downloadable CSV file which we will use for our project.

                      Our team feels that the amount of data in the table is enough to make a significant analysis of drug use in 
                      the United States. Breaking down which drugs affect which communities the most is vital to a solution that 
                       works. This data is provisional, as this is an ongoing epidemic. Significant revelations could be made to predict 
                       future overdose trends, which could save lives in the future. Among severe health crises in our country, overdose 
                        deaths are often overlooked by the general public. It is also important to note that not every death is linked to a 
                        specific drug, and the CDC lays out potential inaccuracies within the linked web page. We plan to account for any 
                        nuances - perhaps such as 'multiple causes of death' - among the data in order to formulate a concise and accurate report.
                        When our project is finished, it will paint a precise, maybe even frightening, picture of the United States. However,
                        we believe it is vital to promote good health within the public."),
                        h3("5.0: Findings"),
                        p("One of the research questions our project seeked to answer was what are the prominent types of drugs associated 
                      with drug overdose? We constructed a pie chart that visually represents the types of drugs used within the 12 
                      Month-ending Provisional Number of Drug Overdose Deaths dataset by the CDC (Centers for Disease Control and Prevention),
                      and the percentage of overdose deaths they are linked to. Through analysis of the dataset, we found that opioids were
                      attributed to 54% of overdose deaths. Heroin contributed to 16%, cocaine contributed to 15%, and psychostimulants contributed
                      to 14% of overdose deaths throughout the United States of America. 
	
                      In relation to the types of drugs that were associated with drug overdose, we were also concerned with answering the question of 
                      which states are the most impacted by drug overdose?, specifically from the aforementioned substances: opioids, heroin, cocaine, 
                      and psychostimulants. Pertinent observations discerned from our organized data table, 'Overdose Deaths in the Most Affected States',
                      showed that the U.S. states with the highest number of drug overdose cases were California, Florida, Ohio and Pennsylvania. These 
                      observations were compiled from the years 2015 to 2021. We noticed that California consistently remained the state with the most overdose
                      cases throughout the years, Florida following a few thousand cases behind. 

	                    Another question our project strives to answer is 'what are the trends of drug overdose across the states and the years?' In our project,
                        we created a summary information function that stores different observations and variables from the VSRR Provisional Drug Overdose Death
                        Counts dataset which was extracted from the cdc.gov website. We organized the information concerning drug overdose through a list that 
                        separates columns into states, months, drug types, years, and the overdose total. This dataset recorded drug overdose cases from each month
                        and state between 2015 to 2021. In our research findings, we discovered that drug overdose deaths nationwide usually increase each year, with
                        an exponential jump from the year 2020 to 2021. Tracking the trend of our dataset, it shows that in January 2015, the drug overdose deaths were
                        at 47,523 cases. However, in January 2021, that number increased dramatically within the 6 year timespan, to 94,670 overdose deaths. Peculiar 
                        enough, our research also tells us that there was a drop in overdose deaths in the year 2019. In 2018, the overdose death was at 70,122 counts.
                        Yet in 2019, that number dropped to 67,697. Another phenomenon our research found was that in September 2021, there were approximately 47,042 
                        overdose cases. This accounts for almost half of overdose cases in the year 2021 which cumulates to 94,670 overdose deaths in total. This 
                        concludes our most pertinent research findings for our project. "),
                        h3("6.0: Discussion"),
                        p("One of our research findings discovered that the four types of drugs with the highest relation to drug overdose cases are opioids, heroin, cocaine,
                      and psychostimulants. From these four drugs, 54% of overdose cases were found to be caused by opioids specifically. Considering that opioids have a 
                      higher prominence to the overdose crisis than the other three drugs, we may conclude that the opioid epidemic plays a substantial role in the increase
                      of overdose cases within the United States during these past few years. The opioid crisis has been growing in prevalence ever since pharmaceuticals began
                      prescribing it to patients in higher doses since the late 1990s. Our statistic is affirmation to just how serious the opioid epidemic truly is, especially
                      when noting how it greatly outweighs the connection heroin, cocaine, and psychostimulants have to drug overdose. This is important, because it highlights
                      the prevalence of opioids on the safety of the community and the effects it has on the wellbeing of the people. This research finding could help in the 
                      argument to take down opioids and help in the fight to dismantle substance abuse within the U.S. If the opioid crisis were to be abolished, one could infer
                      that communities who are severely impacted by drug overdose, especially states such as California, Florida, Ohio and Pennsylvania who suffer from high drug
                      overdose rates, would see less individuals within their communities dying from substance abuse. This research finding is important, because understanding the 
                      prevalence of opioids informs the actions that we take in handling the opioid crisis and drug overdose within the U.S.
                        
                     Another one of our research findings also found that there was a drastic jump in the number of recorded drug overdose cases from the year 2019 all the way to the 
                     year 2021. There were only about 67,697 cases in the year 2019, but this number increased to 72,124 cases in the year 2020 and 94,670 drug overdose cases in the year
                     2021. The Covid outbreak began in early 2020, so from this research finding we can conclude that the substantial spike in drug overdose deaths can be attributed to the
                     Covid pandemic. The Covid pandemic was commonly recognized as a source of stress, depression, and an exacerbation of poor mental health. This is because many individual's
                     families, friends, and other loved ones were either contracting the disease or even dying from it. Many also lost their jobs as restaurants and businesses began to close
                     due to new mandates, policies and an omnipresent fear of the virus. All of these could have contributed to the increase of substance abuse. This is important to understand,
                     as it helps give us insight into the connections pandemics have between society and drug overdose and the ramifications that may ensue from it. "),
                        h3("7.0: Conclusion"),
                        p("In conclusion, the opioid crisis as well as the Covid pandemic both have a strong correlation with the unprecedented increase of drug overdose deaths within the U.S. 
                       throughout the past few years. We were able to come to this assumption by examining trends from our data visualizations within our project. By analyzing datasets extracted
                       from the CDC we were also able to pinpoint which locations within the United States are the most affected by drug overdose, these happen to be California, Florida, Ohio and
                       Pennsylvania. Understanding factors and trends, as well as the locations that are the most susceptible to impact from drug overdose is critical in informing our decisions 
                       on how to combat it. Through our project, we can utilize the data and inferences made to help educate Americans on the prevalence of drug overdose, especially in the hopes 
                       of raising opioid epidemic and mental health awareness. This information can help inform and build a better future for the citizens of America in a country that is less wrought
                       by the ramifications of drug overdose."),
                        h3("Acknowledgements:"),
                        p("I would like to thank our teaching assistant, Shawon Sarkar, for answering all our questions concerning the project, and guiding us in the right direction."),
                        h3("References"),
                        p("Stakeholders' substance use research and Treatment Information Exchange (SSURTIE). PCORI. (2019, November 12). Retrieved February 5, 2022, from https://www.pcori.org/research-results/2014/stakeholders-substance-use-research-and-treatment-information-exchange-ssurtie

                         https://www.cdc.gov/opioids/data/analysis-resources.html

                         Ciccarone, Daniel The rise of illicit fentanyls, stimulants and the fourth wave of the opioid overdose crisis, Current Opinion in Psychiatry: July 2021 - Volume 34 - Issue 4 - p 344-350 doi: 10.1097/YCO.0000000000000717 https://journals.lww.com/co-psychiatry/Fulltext/2021/07000/The_rise_of_illicit_fentanyls,_stimulants__the.4.aspx
                         https://healthdata.gov/dataset/Drug-overdose-death-rates-by-drug-type-sex-age-rac/g82c-hg4c/data")
                        
                        
                      )
             )
             
  ) # navbarPage
) # fluidPage
