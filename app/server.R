#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(datasets)

mtcars$model = sub(" .*", "", rownames(mtcars))
mtcars$model <- factor(mtcars$model)

variable.label = c("wt" = "Weight (1000 lbs)",
                   "hp" = "Gross horsepower",
                   "gear" = "Number of forward gears", 
                   "cyl" = "Number of cylinders")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
      filtered <- mtcars %>%
          filter(
              qsec >= input$qsec[1],
              qsec <= input$qsec[2]
          )
      ggplot(filtered, aes_string(input$variable, "mpg")) +
          geom_point(aes(colour = model), size = 4) +
          guides(color=guide_legend(title="Automobiles")) +
          xlab(variable.label[input$variable]) +
          ylab("Miles/(US) gallon") + 
          ggtitle(paste("MPG vs", variable.label[input$variable], "vs Automobiles"))
  })
  
})
