library(shiny)
library(shinydashboard)

shinyServer(function(input,output){
  output$histogram <- renderPlot({
    hist(faithful$eruptions,breaks = input$bins)
  })
  
  output$msgOutput <- renderMenu({
    msgs <- apply(read.csv("message.csv"),1,function(row){
      messageItem(from = row[["from"]],message = row[["message"]])
    })
    
    dropdownMenu(type="messages",.list = msgs)
    
  })
  output$approvedSales <- renderInfoBox({
    infoBox("Approved sales","10,000,000",icon = icon("bar-chart"))
  })
  output$itemRequested <-renderValueBox({
    valueBox(15*300,"Items requested by employees",icon=icon("fire"),color = "yellow")
  })
})