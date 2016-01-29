
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

library(shiny)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel(h2("Driven Distance of a Car")),
  
  # Sidebar with a slider input for number of bins
  
  sidebarPanel (
  numericInput("obs", "Distance of Your Car in KM:", 10000),


  helpText("Note: Please input the driven distance (0-250000)of car you wish to find the price,
           once completed,  press Predict button."),

  submitButton("Predict")
  # Show a plot of the generated distribution
  ),
  mainPanel(
   h4("Est Price of Your Car in K$"),
    verbatimTextOutput("summary"),
   h4("Model Fit"),
    verbatimTextOutput("fit"),
   h4("The green triangle is your car predication,
      The red line is the lm fitted line"),
   plotOutput("predOut")
   
  )
))

