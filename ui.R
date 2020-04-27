
#library(shiny)

# Define UI for application that draws a histogram

shinyUI(dashboardPage( 
    dashboardHeader(title = "COVID-19"), 
    dashboardSidebar(
        sidebarUserPanel("Sundus Seif", image ="https://i.pinimg.com/originals/46/75/08/4675089ae46725e0a1da8021286c5da2.png"),
        
        sidebarMenu(
            menuItem("Incarceration & COVID-19 ", tabName = "image"),
            menuItem("Tracking Graph", tabName = "graph"),
            menuItem("Tracking Table", tabName = "data"),
            menuItem("Articles", tabName = "articles")
            
        )
  
    ), 
    dashboardBody(
        
        
        tabItems(
            
            tabItem(tabName = "image",
                    headerPanel("NYC Jail (Rikers) COVID-19 Infection Rate Compared to NYC and NYS",),
                    fluidRow(
                        column(12,
                        box(img(src = 'https://lhsbudget.com/wp-content/uploads/2020/04/COVID-19AndPrisonsGraphic-01-900x661.jpg',height = '400px', width = '700px')
                        ,"Elijah Paden", width = 9)),
                        column(12, 
                               textOutput("message")
                        )
                    )
       
            ),
            
            tabItem(tabName = "data",
                    fluidRow(
                        selectizeInput(inputId="selected", "Select Date:", 
                                       choices=colnames(rikersday[,1:11][-9]))),
                    
                    
                    fluidRow(
                        box(dataTableOutput("table"), width = 12)
                    )
                    
            ),
            
            tabItem(tabName = 'graph', 
                    
                    fluidRow(
                        column(4,
                               selectizeInput(inputId="selected1", "As of April 23,2020", 
                                   choices=colnames(rikers))),
                        column(4,
                               selectizeInput(inputId="selected2"," ", 
                                              choices=colnames(nyc))),
                        column(4,
                               selectizeInput(inputId="selected3", " ",
                                              choices=colnames(nys))),
                             
                        ),
                    
                    fluidRow(infoBoxOutput("RikersBox"),infoBoxOutput("NYCStatBox"),infoBoxOutput("NYSStatBox")),
                  
                    fluidRow(
                        column(10,
                               
                               box(htmlOutput("test"), width = 10)),
                                
                        column(2,
                               #box(htmlOutput("line_plot1"), width = 10)),
                               
                               actionButton(inputId = "wk1", label="03/18/20"),
                               actionButton(inputId = "wk2", label="04/01/20"),
                               actionButton(inputId = "wk3", label="04/10/20"),
                               actionButton(inputId = "wk4", label="04/23/20"),
                              # htmlOutput("test")
                               
                               )
                        )
                  ),
         
            tabItem(tabName = "articles",
                    
                    box(tags$a(href="https://www.themarshallproject.org/2020/03/31/why-jails-are-so-important-in-the-fight-against-coronavirus","Why Jails Are So Important in the Fight Against Coronavirus")),
                    box(tags$a(href = "https://www.themarshallproject.org/2020/04/24/tracking-the-spread-of-coronavirus-in-prisons?utm_medium=email&utm_campaign=newsletter&utm_source=opening-statement&utm_term=newsletter-20200425-1968&utm_source=The+Marshall+Project+Newsletter&utm_campaign=1e16ad8dd7-EMAIL_CAMPAIGN_2020_04_25_11_29&utm_medium=email&utm_term=0_5e02cdad9d-1e16ad8dd7-174598028", "Tracking the Spread of Coronavirus in Prisons")),
                    box(tags$a(href= "https://www.themarshallproject.org/2020/04/24/these-prisons-are-doing-mass-testing-for-covid-19-and-finding-mass-infections", "These Prisons Are Doing Mass Testing For COVID-19—And Finding Mass Infections")),
                    box(tags$a(href="https://www.themarshallproject.org/2020/04/25/few-federal-prisoners-released-under-covid-19-emergency-policies" ,"Few Federal Prisoners Released Under COVID-19 Emergency Policies"))
                 )
            
            )
        
        
    )
)

)
