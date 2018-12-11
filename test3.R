# p.27
library(shiny)
ui <- fluidPage(
  titlePanel("BMI"),
  sidebarPanel(
    numericInput('wt', 'Weight in Kg', 70, min = 30, max = 200),
    numericInput('ht', 'Height in cm', 165, min = 50, max = 250),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Result'),
    h4('Your weight'),
    verbatimTextOutput("inputValue1"),
    h4('Your height'),
    verbatimTextOutput("inputValue2"),
    h4('Your BMI is'),
    verbatimTextOutput("results")
  )
)

server <- function(input, output){
  bmi_calc <- function(weight, height) (weight/(height/100)^2)
  output$inputValue1 <- renderPrint({input$wt})
  output$inputValue2 <- renderPrint({input$ht})
  output$results <- renderPrint({bmi_calc(input$wt, input$ht)})
}
shinyApp(ui=ui, server=server)
