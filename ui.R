
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(
  fluidPage(
    
    # Application title
    
    ## Yes, I know using <center> is really tacky.  But this is an exercise in R, not
    ## an exercise in HTML5.  I would do it better in production...
    
    titlePanel(HTML("<center><img src='estimator-banner.png'></center>"),
               windowTitle="Diamond Weight Estimator"),
    
    # Sidebar holds the inputs to the algorithm
    fluidRow(
      column(4,
             h3('Dimensions'),
             selectInput("shape","Shape of Stone:", c("Round", "Heart", "Oval")),
             numericInput("width","Width of diamond (mm):", 6, min=0.1,max=10, step=0.1),
             numericInput("height","Length of diamond (mm):", 6, min=0.1,max=10, step=0.1)
      ),
      
      # Show the calculated gemstone weight along with explanatory help text
      column(8,
             h3("Estimated Weight"),
             h4(textOutput("weight")),
             p("Note: Weights are estimates only, and are affected by the depth of the stone and the cutting process.",
               "Accurate weights can be obtained only by weighing the stone directly.")
      )
    ),
    
    fluidRow(
      column(12,
             hr(style="height: 5px; background-color: #000;")
             )
      ),
    
    fluidRow(
      column(12,
             h3("Instructions:")
      )
    ),
    
    fluidRow(
      column(4,
             htmlOutput("pix")
      ),
      column(8,
             wellPanel(
               p("This program will estimate the weight of a diamond by its measurements.  It assumes",
                 "that the stone is set in a piece of jewelry (e.g., a ring), and that you can only",
                 "measure the width and length of the stone but not its depth."),
               p("You should use fairly decent calipers to measure the dimensions, and all measurements",
                 "are in millimeters. The chart to the left demonstrates how to take the measurements.")
             )
      )
    )
  )
)
