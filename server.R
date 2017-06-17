library(shiny)
library(googleVis)

shinyServer(function(input, output){
  data <- read.csv("Political Data.csv", header = TRUE)
  chartInput <- reactive({
    switch(input$chart, 
    "State Winner (Clinton or Trump)" = 'winner',
    "Percentage of Trump Vote" = 'pcttrump',
    "Partisan Composition of the House" = 'housecomp',
    "Partisan Composition of the Senate" = 'senatecomp'
    )
    })
  
output$p1 <- renderGvis({
  if(input$chart == 'winner') {
    gvisGeoChart(data, "state", "statewinner", options = list(region = "US", displayMode = "regions", resolution = "provinces", colors = "['blue', 'red']", width = 1200, height = 800))
    }
  else if(input$chart == 'pcttrump'){
    gvisGeoChart(data, "state", "trumpvote", options = list(region = "US", displayMode = "regions", resolution = "provinces", colors = "['blue', 'red']", width = 1200, height = 800))
  }
  else if(input$chart == 'housecomp'){
    gvisGeoChart(data, "state", "pctrephouse", options = list(region = "US", displayMode = "regions", resolution = "provinces", colors = "['blue', 'red']", width = 1200, height = 800))
  }
  else if(input$chart == 'senatecomp'){
    gvisGeoChart(data, "state", "pctrepsenate", options = list(region = "US", displayMode = "regions", resolution = "provinces", colors = "['blue', 'red']", width = 1200, height = 800))
  }
})
})