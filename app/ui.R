#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG consumption analysis"),
  
  sidebarLayout(
    sidebarPanel(
        tags$p("Choose a variable to see a plot",
                 "shows relationship between variable, mpg and cars model."),
        radioButtons("variable", "Variable:",
            c("Weight (1000 lbs)" = "wt",
              "Gross horsepower" = "hp",
              "Number of forward gears" = "gear", 
              "Number of cylinders" = "cyl")
        ),
        tags$p("You may limit the data size by specified the qsec range."),
        sliderInput("qsec",
                   "QSec - 1/4 mile time:",
                   min = 14,
                   max = 23,
                   value = c(14,23))
    ),
    
    mainPanel(
        plotOutput("distPlot")
    )
  )
))
