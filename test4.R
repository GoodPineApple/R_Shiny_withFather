# p.27
library(shiny)
ui <- fluidPage(
  titlePanel("BMI"),
  sidebarPanel(
    numericInput('wt', 'Weight in Kg', 70, min = 30, max = 200),
    numericInput('ht', 'Height in cm', 165, min = 50, max = 250),
    numericInput('wt_pound', 'Weight in pound', 150, min = 30, max = 300),
    numericInput('ht_inch', 'Height in inch', 65, min = 30, max = 200),
    submitButton('Submit')
  ),
  mainPanel(
    h3('Result'),
    h4('Your weight'),
    verbatimTextOutput("inputValue1"),
    h4('Your height'),
    verbatimTextOutput("inputValue2"),
    h4('Your BMI is'),
    verbatimTextOutput("results"),
    
    h3('Result'),
    h4('Your weight in KG'),
    verbatimTextOutput("inputValue3"),
    h4('Your height in cm'),
    verbatimTextOutput("inputValue4"),
    h4('Your BMI is'),
    verbatimTextOutput("results2")
  )
)

server <- function(input, output){
  bmi_calc <- function(weight, height) (weight/(height/100)^2)
  output$inputValue1 <- renderPrint({input$wt})
  output$inputValue2 <- renderPrint({input$ht})
  output$results <- renderPrint({bmi_calc(input$wt, input$ht)})
  
  output$inputValue3 <- renderPrint({input$wt_pound}*0.4353592)
  output$inputValue4 <- renderPrint({input$ht_inch}*2.54)
  output$results <- renderPrint({bmi_calc({input$wt_pound}*0.453592, 
                                          {input$ht_pound}*2.54)})
  
}
shinyApp(ui=ui, server=server)
