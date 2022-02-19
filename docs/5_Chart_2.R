<<<<<<< HEAD
# Chart 2

# Load necessary packages (`dplyr`, `ggplot2`, and `plotly`)
library("dplyr")
library("ggplot2")
library("plotly")



# National Overdose Deaths against years with line of best fit
chart2 <- ggplot(overdose_death_national_dt, aes(x= Year, y = Data.Value)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + ylab("National Overdose Deaths") + ggtitle("Annual National Deaths per Year", subtitle = waiver())
chart2

# This chart was made to help gauge whether overdose deaths were increasing or decreasing nationally. 
# You can see that yearly national overdose deaths are increasing at a near linear rate, nearly doubling since 2015, a six year period.
# This indicates that current solutions invented and implemented since 2015 have not prevented the increase of U.S. drug overdoses, addressing our third research question.
=======
# Chart 2

# Load necessary packages (`dplyr`, `ggplot2`, and `plotly`)
library("dplyr")
library("ggplot2")
library("plotly")



# National Overdose Deaths against years with line of best fit
chart2 <- ggplot(overdose_death_national_dt, aes(x= Year, y = Data.Value)) + geom_point() + geom_smooth(method = "lm", se = FALSE) + ylab("National Overdose Deaths") + ggtitle("Annual National Deaths per Year", subtitle = waiver())
chart2

# This chart was made to help gauge whether overdose deaths were increasing or decreasing nationally. 
# You can see that yearly national overdose deaths are increasing at a near linear rate, nearly doubling since 2015, a six year period.
# This indicates that current solutions invented and implemented since 2015 have not prevented the increase of U.S. drug overdoses, addressing our third research question.
>>>>>>> refs/remotes/origin/main
