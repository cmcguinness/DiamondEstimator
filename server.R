
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {
  
  output$weight <- renderText({
    
    wid <- as.numeric(input$width)
    hi <- as.numeric(input$height)
    
    if (input$shape == "Round")
    {
      dep <- ((wid+hi)/2)*0.61       ## Standard estimate for depth of round brilliant is 61% of diameter
      weight <- ((wid+hi)/2)^2*dep*0.0061  ## Standard algorithm for estimating weight of round brilliant
    }
    
    if (input$shape == "Oval")
    {
      dep <- ((wid+hi)/2)*0.6       ## Standard estimate for depth 60% of average of width/height
      
      ## The algorithm for oval is very slightly different from round brilliant.  Changing from round to oval
      ## will not produce significantly different values.
      
      weight <- ((wid+hi)/2)^2*dep*0.0062  ## Standard algorithm for estimating weight of oval brilliant
      
    }
    
    if (input$shape == "Heart")
    {
      dep <- ((wid+hi)/2)*0.5       ## Standard estimate for depth 50% of average of width/height
      weight <- ((wid+hi)/2)^2*dep*0.0057  ## Standard algorithm for estimating weight of heart
    }
    
    sprintf("%.3f CT", weight)
  })
  
})
