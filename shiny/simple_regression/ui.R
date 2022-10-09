library(shiny)

fig.width <- 600
fig.height <- 450

shinyUI(pageWithSidebar(
  
  headerPanel("Simple Linear Regression"),
  
  sidebarPanel(
    
    div(p("Change the Intercept and Slope values below to minimize the Sum of Squares Residuals (i.e. the sum of the squared vertical distances between each data point and the linear regression model line.)")),
    
    div(
      
      sliderInput("intercept",
                  strong("Intercept"),
                  min=0, max=10, step=.5,
                  value=sample(seq(5, 10, .5), 1), ticks=FALSE),
      br(),
      sliderInput("slope", 
                  strong("Slope"),
                  min=-2, max=3, step=.25, 
                  value=sample(seq(-2, 3, .25), 1), ticks=FALSE),
      br(),
      checkboxInput("summary",
                    strong("Show summary(lm(y ~ x))"),
                    value=FALSE),
      br(),
      shiny::actionButton(inputId='ab1', label="View App Code", 
                          icon = icon("github"), 
                          onclick ="window.open('https://github.com/billster45/StatApps/tree/master/shiny/simple_regression', '_blank')")
      
    )
  ),

  mainPanel(
    div(plotOutput("reg.plot", width=fig.width, height=fig.height),
        title="y = 8 + x"),
    div(plotOutput("ss.plot", width=fig.width, height=fig.height / 3)),
    div(plotOutput("resid.plot", width=fig.width, height=fig.height / 2)),
    div(class="span7", conditionalPanel("input.summary == true",
                                        p(strong("Linear model summary")),
                                        verbatimTextOutput("summary")))
  )
    
))