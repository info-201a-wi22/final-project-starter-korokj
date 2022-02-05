# Examining Drug Overdoses in the U.S.

## **Code name**:
US-OD

## **Project title**:
Examining Drug Overdoses in the U.S.

## **Authors**:
Joseph Koroki: korokj@uw.edu
Cameron Rezek: jcrezek@uw.edu
Soneta Un: sone5@uw.edu


## **Affiliation**:
INFO-201: Technical Foundations of Informatics - The Information School - University of Washington

## **Date**:
Winter 2022
02/04/2022

## **Abstract**:
Our main question is what is the solution to the rising drug overdose deaths in the U.S.? This is important because drug overdosing has been a key issue in the U.S. since the 1970s. To address this concern, we will look at the variables associated with drug overdose deaths.

## **Keywords**:
overdose deaths in the U.S. data; drug abuse; effects of drugs on the human physiology; symptoms and side effects; drug laws and legislation

## **1.0 Introduction**:
Overdose deaths in the United States are at an all-time high, continuing an unprecedented trend that has only gone up in the past few decades. Many variables spur it, and much of the blame falls on the increasing popularity of opiates within the country. Our project aims to examine the data collected on overdose deaths stemming from using all different kinds of drugs. Specifically, we want to look for trends within states and years and find a relevant correlation between the two. We hope that our project helps educate Americans on the rising numbers of overdose deaths and inform them what areas of the country are at the highest risk. Through careful analysis, we also want to look for tendencies amongst the data, such as what drugs are affecting which cities the most severely. Ultimately, our team chose this topic to spread awareness of the dangers of certain drugs and shine a light on the path the United States is heading toward.

## **2.0 Design Situation**:
**Framing the Topic of Concern**: The topic of concern we are addressing in our data science project is deaths within the U.S. caused by drug overdose. Key elements within this topic are what drugs are being used within the substance abuse epidemic, how the usage of drugs affects the dichotomy of society and the people living within it, what we can learn about the power and influence of substance abuse, and how this issue is addressed. The key scientific issues are the impact drugs have on human physiology and rapidly decreasing life spans, including death. A social issue concerning drugs is the demographic of people it may be harming, and how this may put them at a great disadvantage compared to others who may not be experiencing the repercussions of drug usage. An economic issue would be how the vast and high-in-demand drug business affects markets. A governmental issue would be how legislation addresses the legalization of drugs in U.S. states, and how it takes action against the overdose crisis.
**Human Values**: Human values that are connected to our topic of drug overdose would be empathy, equality, respect, and the appreciation and value of human life. Oftentimes the issue of drug usage is overlooked or ignored, which is the equivalent of turning a blind-eye to those who are suffering from substance abuse. Many believe that individuals who put themselves in a critical state of need from taking drugs are at fault for putting themselves in that position, and earn no sympathy. However, this human value of responsibility for one’s own actions completely neglects taking action for those who need it most and empathizing with the conflicts that brought them there.
**Stakeholders**: Direct stakeholders of substance abuse within the U.S. would be individuals who partake in the usage of drugs or those you have overdosed. Indirect stakeholders would be policy makers, designers and engineers that develop products and solutions to drug abuse, researchers, clinicians and family members of those who have loved ones experiencing drug abuse.
**Benefits and Harms**: The potential harm that comes from interventions taken with data and technology, is that some datasets may be inaccurate or do not have enough data to be considered reliable or conclusive. Potential benefits, however, would be that a well-developed solution could help countless people suffering from drug abuse. Stakeholders that are likely to benefit from these solutions would be family members, patients, victims, designers, engineers, clinicians, and researchers. These stakeholders are also likely to be harmed by a misinformed solution. An unanticipated consequence might be public outrage due to a restriction on drugs.

## **3.0 Research Questions**:
1) What specific drugs are the most responsible for death caused by drug overdose?
2) Which demographic is the most affected by drug overdose/abuse?
3) Which locations within the U.S. have the highest number of drug overdoses?
4) What solutions have been invented to prevent the increase of drug overdose?
5) What drugs run a higher risk of overdose and death? Why?
The five questions mentioned above pose questions about information that would be essential in understanding drug overdose and how to combat it. Learning what drugs cause the most deaths or are more likely to incite overdose, either due to addictive properties, accessibility, or other factors would be critical in the development of solutions to address this situation. Also, recognizing what demographics and in what location these drugs are affecting the most will help us understand why drug overdose occurs and how it can be prevented.

## **4.0 The Dataset**:
https://www.cdc.gov/nchs/nvss/vsrr/drug-overdose-data.htm#data-tables
Nrow: 44695
Ncol: 12
Overdose deaths throughout the US are accounted for and broken down by state and month. The mortality data is pulled from the National Vital Statistics System. The deaths are counted throughout all 50 states, including the District of Columbia. The observation in this instance would be a specific state (broken down by month).

The data goes beyond just the number of overdose deaths: it also includes what drug caused the overdose if that data is available. The number of fatalities, type of drug, the year, and the month would all be considered variables. The CDC conducts case surveillance through the National Notifiable Diseases Surveillance System, which works with over 3,000 health departments. This data set was recorded from the beginning of 2015 thru 2021. The CDC’s goal from collecting this data is to protect and preserve their local communities. The CDC acquires its funding by annual appropriations determined by the U.S. Congress and charitable donations. Data collection is paramount to protecting the public’s safety and health. Their validation efforts are internal and subject to auditing and validation by external agencies, which upholds the quality of the data. Data is held secure with Federal Information Processing Standard (FIPS) encryption. CDC’s efforts to increase credibility and trustworthiness with the public are well documented, and there is a section on their site that showcases all their peer reviews. Our particular dataset includes a downloadable CSV file which we will use for our project.


Our team feels that the amount of data in the table is enough to make a significant analysis of drug use in the United States. Breaking down which drugs affect which communities the most is vital to a solution that works. This data is provisional, as this is an ongoing epidemic. Significant revelations could be made to predict future overdose trends, which could save lives in the future. Among severe health crises in our country, overdose deaths are often overlooked by the general public. It is also important to note that not every death is linked to a specific drug, and the CDC lays out potential inaccuracies within the linked web page. We plan to account for any nuances - perhaps such as “multiple causes of death” - among the data in order to formulate a concise and accurate report. When our project is finished, it will paint a precise, maybe even frightening, picture of the United States. However, we believe it is vital to promote good health within the public.


## **5.0 Expected Limitations**:
The expected or possible implications this research could have for technologists, designers, and policymakers is that the information garnered by the collectivity of these studies may help policymakers make informed decisions on whether or not to take legal action on drug abuse, and how they may go about that process if they decide to. Research programs such as the Stakeholder’s Substance Use Research and Treatment Information Exchange (SSURTIE) develops infrastructure to help promote those who have connections to substance abuse disorder treatment, including those that administer it. This program also engages directly with policymakers, clinicians, and researchers. Research on substance abuse could encourage the development of more programs with the purpose of designing solutions to drug overdose. It will also help lead designers and technologists within those programs or corporations to create innovations that may help to ameliorate the ongoing issue of drug abuse and overdose. The purpose of research is to help inform and coax understanding in order to make informed solutions.


## **6.0 Limitations**:
Limitations we could encounter during our project may be a lack of data files pertaining to our topic that meets the 200/50-100K observations requirement. Another way that our project’s potential may be inhibited is the level of classification and access to research, files, and studies surrounding this topic. Drug abuse, although a prevalent topic within the U.S. is equally just as broad. There is a wide variety of drugs, including legal medications, with studies being conducted on its various symptoms and side effects. It may be difficult and time-consuming to filter through the multitude of information on drugs. In researching this topic, there are also several different factors we would have to take into account, such as the categorization of drugs, the demographics they are affecting, drug laws and regulations, and each state’s differing stance on the legalization of drugs. We would need to be much more specific within our research to be able to understand the gravity of this topic.


## **Acknowledgements**:
I would like to thank our teaching assistant, Shawon Sarkar, for answering all our questions concerning the project, and guiding us in the right direction.


## **References**:
Stakeholders' substance use research and Treatment Information Exchange (SSURTIE). PCORI. (2019, November 12). Retrieved February 5, 2022, from https://www.pcori.org/research-results/2014/stakeholders-substance-use-research-and-treatment-information-exchange-ssurtie

https://www.cdc.gov/opioids/data/analysis-resources.html

Ciccarone, Daniel The rise of illicit fentanyls, stimulants and the fourth wave of the opioid overdose crisis, Current Opinion in Psychiatry: July 2021 - Volume 34 - Issue 4 - p 344-350
doi: 10.1097/YCO.0000000000000717
https://journals.lww.com/co-psychiatry/Fulltext/2021/07000/The_rise_of_illicit_fentanyls,_stimulants__the.4.aspx


## **Appendix A: Questions**:
None
