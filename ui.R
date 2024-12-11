library(shiny)
library(shinydashboard)

shinyUI(
  dashboardPage(title = "Demo app",skin="red",
    dashboardHeader(title="This is a header",
                    dropdownMenuOutput("msgOutput"),
                    # dropdownMenu(type = "message",
                    #              messageItem(from = "Finance Update",message = "We are meeting our threshold"),
                    #              messageItem(from = "Sales Update",message = "Sales at 55% need to be more aggressive",icon = icon("bar-chart"),time = "00:00"),
                    #              messageItem(from = "Sales Meeting",message = "Sales meeting at 1600hrs",icon=icon("handshake"),time = "1600")
                    #              ),
                    dropdownMenu(type = "notifications",
                                 notificationItem(
                                   text =  "2 new messages added to the dashboards",
                                   icon = icon("dashboard"),
                                   status = "success"
                                 ),
                                 notificationItem(
                                   text = "Sever is currently running at 95% load",
                                   icon = icon("warning"),
                                   status = "warning"
                                 )),
                    dropdownMenu(type="tasks",
                                 taskItem(
                                   value = 80,
                                   color = "aqua",
                                   "shiny dashboard education"
                                 ),
                                 taskItem(
                                   value = 55,
                                   color = "red",
                                   "Overall education"
                                 ),
                                 taskItem(
                                   value = 40,
                                   color = "green",
                                   "Data science Education"
                                 )
                                 )
                    ),
    
    dashboardSidebar(
      
      sidebarMenu(
        sidebarSearchForm("searchText","buttonSearch","search"),
      menuItem("Dashboard",tabName = "dashboard"),
        menuSubItem("Finance Dashboard",tabName = "finance"),
        menuSubItem("Sales Dashboard",tabName = "sales"),
      menuItem("Detailed Analysis",badgeLabel = "New",badgeColor = "green"),
      menuItem("Raw data")
    )),
    dashboardBody(
      tabItems(
        tabItem(tabName = "dashboard",
                fluidRow(
                  column(width = 7,
                  infoBox("Sales",1000,icon = icon("thumbs-up")),
                  infoBox("Sales",paste0("20%"),icon=icon("warning")),
                  infoBoxOutput("approvedSales")
                  )
                ),
                fluidRow(
                  valueBox(15*200,"Budget remaining for the last 15 days",icon=icon("hourglass-3")),
                  valueBoxOutput("itemRequested")
                ),
                fluidRow(
                  tabBox(
                  tabPanel(title="History of faithful",status = "primary",solidHeader = T,background = "aqua",
                           plotOutput("histogram")),
                  tabPanel(title = "Dashboard controls",status = "warning",solidHeader = T,background = "red",
                      "Use these controls to fine tune the dashboard",br(),br(),
                      "Excessive use of controls confuses the users",
                      sliderInput("bins","Number of breaks",1,100,50),
                      textInput("text_input","search oppoturnities",value="123456"))
                )
                  
                )
      ),
      
      tabItem(tabName = "finance",
              h1("Finance Dashboard")
               ),
      tabItem(tabName = "sales",
              h1("Sales Dashboard"))
      
        
      )
    )
  )
)