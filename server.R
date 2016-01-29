
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
# 
# http://www.rstudio.com/shiny/
#

# load the dataset and train the model


library(shiny)

shinyServer(function(input, output) {
  
  set.seed(12345)
  UsedCars <- read.csv("./Clean.csv", header = TRUE)
  lm.Dist1 <- lm(Price ~ Distance, data = UsedCars)

  DistInput <- reactive({
  yourCar <-  data.frame(input$obs)
  names(yourCar) <- "Distance"
  round(predict(lm.Dist1, newdata = yourCar),2)
  })
  output$summary <- renderPrint({
  DistInput()
  })
  output$fit <- renderPrint({
  lm.Dist1
  })
  output$predOut <- renderPlot({
    plot(UsedCars$Distance, UsedCars$Price,  
         xlab = "Distance in KM", 
         ylab = "Price in 1000$ ", 
         bg = "lightblue", 
         col = "black", cex = 1.1, pch = 21,frame = FALSE)
    abline(lm(Price ~ Distance, data = UsedCars), lwd = 2, col = "red")
    points(input$obs,DistInput(), pch = 25, col  = "green", lwd = 13)
  })
})
