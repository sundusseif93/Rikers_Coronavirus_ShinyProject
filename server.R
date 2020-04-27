



# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    
    
    ##########################
    ## Image text ##
    
    output$message <- renderText({
        
        " The incarcerated population are living in the largest hotspot in the nation for coronavirus infections. Prisons are overpopulated and the incarcerated folks are denied access to supplies to protect them from COVID-19. Data collected by The Marshall Project shows that thousands of prisoners in the nation have caught COVID-19 and the number of cases has grown more than threefold in the first week of April. The data observed in this project is collected by The Legal Aid Society comparing COVID-19 infection rate in NYC Jail (Rikers) to NYC and NYS. "
    })
    

    
    ##########################
    
    ### PLOTS ###

    rv <- reactiveValues(data=rikersday$Date)
    
    ### DATA FOR THE FIRST 10 DAYS ###
    observeEvent(input$wk1, 
                 output$test <- renderGvis({

                     rikersday_1 <- filter(rikersday, Date <= format(as.Date(rikersday$Date[1]) + 10))
                     
                     #rikersday["Date", count=1]
                     gvisLineChart(rikersday_1, xvar="Date",
                                   c("NYC Jails (Rikers) Infections/ 1,000 people","NYC Infections/ 1,000 people","NYS Infections/ 1,000 people"),
                                   options = list(width="100%", height = "475px", title= "COVID-19 Infection Rates/ 1,000 people",vAxis="{viewWindow: {min: 0, max: 100}, gridlines:{count: 25}}"      
                                                  
                                   ))   
                 })
    )
 
    
    ### DATA FOR THE FIRST 20 DAYS ###
    observeEvent(input$wk2, 
                 output$test <- renderGvis({
                     
                     rikersday_2 <- filter(rikersday, Date <= format(as.Date(rikersday$Date[1]) + 20))
                     
                     gvisLineChart(rikersday_2, xvar="Date",
                                   c("NYC Jails (Rikers) Infections/ 1,000 people","NYC Infections/ 1,000 people","NYS Infections/ 1,000 people"),
                                   options = list(width="100%", height = "475px", title= "COVID-19 Infection Rates/ 1,000 people",vAxis="{viewWindow: {min: 0, max: 100}, gridlines:{count: 25}}"
                                   ))
                 })
                 
    )
    
    
    ### DATA FOR THE FIRST 30 DAYS ###
    observeEvent(input$wk3, 
                 output$test <- renderGvis({
                  
                     rikersday_3 <- filter(rikersday, Date <= format(as.Date(rikersday$Date[1]) + 30))
                     
                     gvisLineChart(rikersday_3, xvar="Date",
                                   c("NYC Jails (Rikers) Infections/ 1,000 people","NYC Infections/ 1,000 people","NYS Infections/ 1,000 people"),
                                   options = list(width="100%", height = "475px", title= "COVID-19 Infection Rates/ 1,000 people",vAxis="{viewWindow: {min: 0, max: 100}, gridlines:{count: 25}}"
                                   ))
                 })
                 
    )
    
    
    ### DATA FOR THE FIRST 40 DAYS ###
    observeEvent(input$wk4, 
                 output$test <- renderGvis({
                     
                     #rikersday24 <- filter(rikersday24,Date==input$date)
                     
                     rikersday_4 <- filter(rikersday, Date <= format(as.Date(rikersday$Date[1]) + 40))
                     
                     gvisLineChart(rikersday_4, xvar="Date",
                                   c("NYC Jails (Rikers) Infections/ 1,000 people","NYC Infections/ 1,000 people","NYS Infections/ 1,000 people"),
                                   options = list(width="100%", height = "475px", 
                                                  title= "COVID-19 Infection Rates/ 1,000 people",
                                                  vAxis="{viewWindow: {min: 0, max: 100}, gridlines:{count: 25}}" 
                                                  
                                   ))
                 })
                 
    )
    
 
    ### DATA TABLE ###
    rikersday1 <- rikersday[,1:11][-9]
    output$table=DT::renderDataTable({
        datatable(rikersday1,rownames = F) %>% 
            formatStyle(input$selected, background = "pink",
                    fontWeight = 'bold')
    })
    
    
    
    ### INFORMATION BOXES ###
    
    range1 <- rikersday[,2:14]
    output$StatBox=renderInfoBox({
        infoBox(title="Rikers Jail Infections", max(range1[,input$selected])) #input$selected
    })
    
    output$RikersBox=renderInfoBox({
        infoBox(title="NYC Rikers Jail Infections", max(range1[,input$selected1]))
    })
    output$NYCStatBox=renderInfoBox({
        infoBox(title="New York State Infections", max(range1[,input$selected2]))
    })
    output$NYSStatBox=renderInfoBox({
        infoBox(title="New York City Infections", max(range1[,input$selected3]))
    })
    
    
})

