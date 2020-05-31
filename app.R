# 3/n Rule Calculator
# Developed by Tony Gojanovic
# June 1, 2020
#
# This calculator is based on the 3/n rule or how bad can a defect rate really be given that zero defects are observed in a sample.

#setwd("/Users/tonygojanovic/data/Rprojects/3n_calc/")

ui <- fluidPage(
  # App title ----
  titlePanel("Zero Defect Calculator"),
  
  # Sidebar with slider inputs for risk levels
  sidebarLayout(
    sidebarPanel(
        numericInput('sample_size', 'Observed Risk Calculator: Sample size in which "zero" defects were observed:',100,min=0,max=10000,step = 1),
        numericInput('max_risk', 'Sample Size Calculator: Maximum allowable risk desired:',0.005,min=0,max=0.05,step = 0.001),
        submitButton('Calculate')
    ),
    mainPanel(withMathJax(),
    h3("Instructions"),
    p("This calculator is based on the idea of what happens when 'zero' defects are observed in a sample.  
    Just because a sample shows 'zero' defects, doesn't mean the true defect level is zero ... 
    the defect level could be so small so the sample size chosen doesn't show any problems."),
    
    strong("Observed Risk Calculator"),
    p("The observed risk calculator takes a given sample size and calculates the maximum possible defect level consistent 
    with observing 'zero' defects (it could be truly zero or as high as the estimated value)."),
    p("Example: Given a sample size of 100 with '0' observed defects, the true defect level could be anywhere between 0 and  0.03 (3%) and still
    be consistent with '0' observed defects."),
    
    strong("Sample Size Calculator"),
    p("The sample size calculator takes a maximum allowable risk and calculates the minimum possible sample size consistent with observing 'zero' defects."),
    p("Example: Given a maximum allowable defect level of 0.005, a sample size of 600 with no observed defects would assure the true defect level would be no greater than 0.005."),
    strong("Notes"),
    p("The above assumes random sampling and independence between events. Calculations are based on a 95% confidence interval.  Sample sizes of 20 or greater are suggested for best results.
    for more examples, click on the following: "),
    tags$a(href="https://www.youtube.com/watch?v=AK03n1N52QA&t=38s", "YouTube Video on the 3/n Rule"),
      h3("Observed Risk Calculator"),
        h4("The worst case or maximum risk in a sample of size of"),
        verbatimTextOutput("sample_size", placeholder = TRUE),
        h4("consistent with 'zero' observed defects could be as high as:"),
        verbatimTextOutput("risk"),
      h3("Sample Size Calculator"),
        h4("Given a maximum allowable risk level of"),
        verbatimTextOutput("risk_input", placeholder = TRUE),
        h4("the sample size given below with no observed defects is required"),
        verbatimTextOutput("min_sample"),
        tags$a(href="https://github.com/cowboy2718/3n_calculator", "Click here for more information on the calculator including code on github")
    
    )
  )
)

calculate_max_risk <- function(sample_size) {
  return(3/sample_size)
}  
calculate_n<- function(max_risk) {
  return((3/max_risk))
}  

# Define server logic to plot shelf life ----
server<-(
    function(input, output) {
    output$risk <- renderPrint({calculate_max_risk(input$sample_size)})
    output$sample_size<-renderPrint(input$sample_size)
    output$risk_input<-renderPrint({input$max_risk})
    output$min_sample<-renderPrint({calculate_n(input$max_risk)})
    }
  )

shinyApp(ui,server)