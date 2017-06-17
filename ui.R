library(shiny)
library(googleVis)

shinyUI(pageWithSidebar(
  headerPanel("2016 Election Maps"),
  sidebarPanel(
    selectInput("chart", "Choose a Visualization:", 
                choices = c("State Winner (Clinton or Trump)" = "winner", "Percentage of Trump Vote" = "pcttrump", "Partisan Composition of the House" = "housecomp", "Partisan Composition of the Senate" = "senatecomp")),
    submitButton("Submit"),
    h5("Data Sources:"),
    h5(a("The New York Times", href = "https://www.nytimes.com/elections/results/president")),
    h5(a("U.S. House of Representatives, Office of the Clerk", href = "http://clerk.house.gov/member_info/olm-115.pdf")),
    h5(a("U.S. Senate", href = "https://www.senate.gov/general/contact_information/senators_cfm.cfm"))
  ),
  mainPanel(
    htmlOutput('p1')
  )
))
