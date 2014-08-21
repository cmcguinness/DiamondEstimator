##
## Diamond Weight Estimator Shiny App, Server Code
##
## This code takes the shape of the diamond, the width, and height (aka length), and
## estiates how much the stone weighs.  The code uses industry standard formula
## for estimating weights as published by the Gemological Institute of America and others

library(shiny)

shinyServer(function(input, output) {
  
  ## We have two outputs
  
  ## #1: The estimated weight of the stone
  output$weight <- renderText({
    
    ## Regardless of the shape of the stone, we want the width and height (length)
    ## the user inputed into the UI
    wid <- as.numeric(input$width)
    hi <- as.numeric(input$height)
    
    ## Calculate the weight for a Round Brilliant shape
    if (input$shape == "Round")
    {
      dep <- ((wid+hi)/2)*0.61       ## Standard estimate for depth of round brilliant is 61% of diameter
      weight <- ((wid+hi)/2)^2*dep*0.0061  ## Standard algorithm for estimating weight of round brilliant
    }
    
    ## Calculate the weight for a Oval Brilliant shape
    if (input$shape == "Oval")
    {
      dep <- ((wid+hi)/2)*0.6       ## Standard estimate for depth 60% of average of width/height
      
      ## The algorithm for oval is very slightly different from round brilliant.  Changing from round to oval
      ## will not produce significantly different values.
      
      weight <- ((wid+hi)/2)^2*dep*0.0062  ## Standard algorithm for estimating weight of oval brilliant
      
    }
    
    ## Calculate the weight for a Heart shape stoned
    if (input$shape == "Heart")
    {
      dep <- ((wid+hi)/2)*0.5       ## Standard estimate for depth 50% of average of width/height
      weight <- ((wid+hi)/2)^2*dep*0.0057  ## Standard algorithm for estimating weight of heart
    }
    
    sprintf("%.3f CT", weight)
  })
  
  output$pix <- renderUI({
    shape = tolower(input$shape)
    HTML(paste0("<img src='", shape, ".png'>"))
  })
  
})
