# Key packages for the app

#  install.packages("shiny") # For the shiny app
#  install.packages("bslib") # For certain shiny app traits
#  install.packages("readr") # For loading csv
#  install.packages("shinythemes") # For shiny themes
#  install.packages("thematic") # For consistence between layout and plots
#  install.packages("reactable") # For table
#  install.packages("reactablefmtr") # For table
#  install.packages("here") # For file management
#  install.packages("shinylive") # For github optimisation
#  install.packages("htmltools") # For the DOI links
#  install.packages("magrittr") # For the pipe (avoided tidyverse in case it makes it more difficult for shinyserver)
#  install.packages("dplyr") # For the mutate functions 

# Loading the packages

library(shiny) 
library(bslib)
library(readr)
library(shinythemes)
library(thematic)
library(reactable)
library(reactablefmtr)
library(here)
library(shinylive)
library(htmltools)
library(magrittr)
library(dplyr)


# Uploading the table

Table6 <- 
  read_csv(here("Data",
                "Processed Data",
                "Table6.csv"))

# Now I create the colour code I want the classification variable to have:

Table6 <- Table6 %>%
  mutate(
    Classification_colours = case_when(Classification == "High" ~ "darkgreen",
                                       Classification == "Low" ~ "red",
                                       TRUE ~ "orange")
  )

# Creating a tooltip option that will be used in the headers.

with_tooltip <- function(value, tooltip) {
  tags$abbr(style = "text-decoration: underline; text-decoration-style: dotted; cursor: help",
            title = tooltip, value)
}


# I will need a different DOI table for Table 6:

DOITable6 <- data.frame(
  Study_ID = c("16", "31", "17", "18", "18", "31", "18", "16", "31", "17",
               "18", "16", "31", "5"),
  DOI = c("https://doi.org/10.1002/ajcp.12092",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-018-0948-8",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1002/ajcp.12092",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "https://doi.org/10.1007/s11121-018-0948-8",
          "https://doi.org/10.1007/s11121-012-0359-1",
          "https://doi.org/10.1002/ajcp.12092",
          "https://doi.org/10.1016/j.jsp.2015.09.002",
          "http://dx.doi.org/10.1037/spq0000233"))
