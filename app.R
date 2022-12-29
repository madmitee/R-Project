library(shiny)
library(DT)
library(ggplot2)
library(plotly)
library(dplyr)

## app.R ##
library(shinydashboard)



ui <- dashboardPage(
  dashboardHeader(title = "Basic dashboard"),
  ## Sidebar content
  dashboardSidebar(
    sidebarMenu(
      menuItem("Sissejuhatus", tabName = "sissejuhatus", icon = icon("dashboard")),
      menuItem("Andmed", tabName = "andmed", icon = icon("th")),
      menuItem("Korrelatsionimatriks", tabName = "matrix", icon = icon("th"))
    )
  ),
  ## Body content
  dashboardBody(
    tabItems(
      # First tab content
      tabItem(tabName = "sissejuhatus",
              h2("Sissejuhatus:"),
              tags$div(
                tags$img(src = "dataset-cover.png", width = "200px", height = "100px"),
                tags$p("See andmestik sisaldab informatiivseid andmeid kogu maailmast vaimse tervise häirete, sealhulgas skisofreenia, bipolaarse häire, söömishäirete, ärevushäirete, uimastitarbimise häirete, depressiooni ja alkoholitarbimise häirete levimuse kohta.")),
                tags$p("Neid andmeid hõlpsasti visualiseeritavas vormingus esitades saate ülevaate sellest, kuidas need probleemid elusid mõjutavad; mis võimaldab neid tingimusi ja tagajärgi sügavamalt mõista. Selle mõtiskluse kaudu saate ehk vastata mõnele olulisele küsimusele:"),
              tags$ol(
                tags$li("Milliseid vaimse tervise häireid kannatavad inimesed kogu maailmas?"), 
                tags$li("Kui palju inimesi igas riigis kannatab vaimse tervise probleemide all?"), 
                tags$li("Kas meestel või naistel on suurem tõenäosus depressiooniks?"),
                tags$li("Kas depressioon on seotud enesetapuga ja milline on selle protsent?"),
                tags$li("Millistes vanuserühmades esineb depressiooni sagedamini?"),
              )
      ),
      
      # Second tab content
      tabItem(tabName = "andmed",
              h2("Tunnused:"),
              tags$div(
                tags$p(tags$b("Entity :")," Iga andmekogumisse kaasatud riigi või piirkonna kordumatu identifikaator. (string)",
                       tags$br(),
                       tags$b("Code :")," Unikaalne kood, mis on seotud andmekogumis sisalduva üksuse/riigi või piirkonnaga. (string)",
                       tags$br(),
                       tags$b("Year :")," Aasta, mil selle konkreetse üksuse/riigi kohta andmed koguti. (Integer)",
                       tags$br(),
                       tags$b("Schizophrenia(%) :")," Skisofreeniahaigete protsent selles riigis/regioonis selle aasta jooksul. (Float)",
                       tags$br(),
                       tags$b("Bipolar disorder(%) :")," Bipolaarse häirega inimeste protsent selles riigis/regioonis selle aasta jooksul. (Float)",
                       tags$br(),
                       tags$b("Eating disorders(%) :")," Söömishäiretega inimeste protsent selles riigis/regioonis selle aasta jooksul. (Float)",
                       tags$br(),
                       tags$b("Anxiety disorders(%) :")," Selle aasta jooksul selles riigis/regioonis ärevushäiretega inimeste protsent. (Float)",
                       tags$br(),
                       tags$b("Drug use disorders(%) :")," Narkootikumide tarvitamise häiretega inimeste protsent selles riigis/regioonis selle aasta jooksul. (Float)",
                       tags$br(),
                       tags$b("Depression(%) :")," Selle aasta jooksul selles riigis/regioonis depressiooniga inimeste protsent. (Float)",
                       tags$br(),
                       tags$b("Alcohol use disorders(%) :")," Alkoholitarvitamise häiretega inimeste protsent selles riigis/regioonis selle aasta jooksul. (Float)",
                       tags$br())
              ) 
      ),
      # Second tab content
      tabItem(tabName = "matrix",
              h2("Widgets tab content")
      )
    )
  )
)

server <- function(input, output) {
  set.seed(122)
  histdata <- rnorm(500)
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data)
  })
}

shinyApp(ui, server)