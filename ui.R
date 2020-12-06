## ui.R
# https://recommendationsysdevin.shinyapps.io/bookrecommender/
library(shiny)
library(shinydashboard)
library(recommenderlab)
library(data.table)
library(ShinyRatingInput)
library(shinyjs)

source('functions/helpers.R')

shinyUI(
    dashboardPage(
          skin = "black",
          dashboardHeader(title = "Movie Recommender"),
          
          dashboardSidebar(disable = FALSE,
                           
                           sidebarMenu(
                             # Setting id makes input$tabs give the tabName of currently-selected tab
                             id = "tabs",
                             menuItem("Dashboard", tabName = "dashboard"),
                             menuItem("System Type", icon = icon("cog"),
                                      menuSubItem("System I", tabName = "dashboardBody1"),
                                      menuSubItem("System II", tabName = "dashboardBody2")
                             )
            )
          ),

          dashboardBody(includeCSS("css/movie.css"),
            tabItems(
              tabItem(tabName ="dashboard", 
                      h2("Movie Recommender System"), 
                      "Have you ever felt overwhelmed by millions of movies to watch on Netflix? Have you ever searched for a movie that is alike to your favorites? This movie recommender system will help you solve the issue. The movie recommender includes two ways of recommending movies for you:", 
                      HTML("<ul>
                              <li><b>System I</b> is built on User-Based Colloboration Filtering. In this system, please rate as many movies as possible based on your personal taste. The system will give back 10 recommendations that you might be interested in watching in the future. </li>
                              <li><b>System II</b> is built on Content-Based Filter. In this system, please select your favorite genre. There are totally 18 genres available for you to select. After selection, the system will give back top 10 most popular movies in that genre.</li>
                              <li><b>Source: </b> In this app, the UI interface is built on pspachtholz's BookRecommender and the server is built on Professor Liang's code. </li>
                           </ul>"),
                      HTML("<p style='text-align:center;'><img src='https://connect.ignatiuz.com/hubfs/AI%20and%20Deep%20Learning.gif'>")
              ),
              tabItem("dashboardBody1",
                fluidRow(
                    box(width = 12, 
                        title = "Step 1: Rate as many movies as possible", 
                        status = "info", 
                        solidHeader = TRUE, 
                        collapsible = TRUE,
                        div(class = "rateitems",
                            uiOutput('ratings')
                        )
                    )
                  ),
                
                fluidRow(
                    useShinyjs(),
                    box(
                      width = 12, status = "info", solidHeader = TRUE,
                      title = "Step 2: Discover movies you might like",
                      br(),
                      withBusyIndicatorUI(
                        actionButton("btn", "Click here to get your recommendations", class = "btn-warning")
                      ),
                      br(),
                      tableOutput("results")
                    )
                 )
              ),
              
              tabItem("dashboardBody2",
                      fluidRow(
                      box(
                        width = 12, status = "info", solidHeader = TRUE,
                        title = "Step 1: Select your favorite genre:",
                          withBusyIndicatorUI(
                            selectInput("genre", "", 
                                      choices=c("Action", "Adventure", "Animation", 
                                                "Children's", "Comedy", "Crime",
                                                "Documentary", "Drama", "Fantasy",
                                                "Film-Noir", "Horror", "Musical", 
                                                "Mystery", "Romance", "Sci-Fi", 
                                                "Thriller", "War", "Western"),
                                      selected = "Animation"))
                        )
                      ),
                      
                      fluidRow(
                        useShinyjs(),
                        box(
                          width = 12, status = "info", solidHeader = TRUE,
                          title = "Step 2: Discover movies you might like",
                          br(),
                          tableOutput("results2")
                          )
                        )
                      )
              
            )
          )
    )
) 

