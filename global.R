# install.packages("rio")
# install.packages('shiny')
# install.packages("dplyr")
# install.packages("ggplot2")
# install.packages("googleVis")
# install.packages("googleCharts")
# install.packages("shinydashboard")
# install.packages("DT") #creates datatables
# install.packages("base")


library(shiny)
library(scales)
library(readxl)
library(shinydashboard)
library(DT)
library(data.table)
library(dplyr)
library(tidyr)
library(tidyverse)
library(base)
library(plotly)
library(ggplot2)
#library(rio)
library(googleVis)
#library(googleCharts)
#library(reshape2)



rikersday <- read_xlsx("4_23_Rikers-Coronavirus-Comparison-Chart_last-updated-11PM.xlsx")

rikersday <- rikersday %>% mutate_if(is.numeric, round, digits=2)

rikersday[,1]=lubridate::date(rikersday$Date)

nys=select(rikersday, c(7,4))
nyc=select(rikersday, c(6,3))
rikers = select(rikersday, c(5,2))



#format(1e6, big.mark=",", scientific=FALSE) 
