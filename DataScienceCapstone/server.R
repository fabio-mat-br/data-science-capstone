require(shiny)
require(ggvis)
require(magrittr)
library(qdap)
library(tm)
library(SnowballC)
library(dplyr)
library(plyr)
library(stringr)
require(markdown)

options("scipen" = 99, "digits" = 9)
source("functions.R")

dataLoaded <- FALSE

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {
  observe({
    output$vbtConsole <- renderPrint(
      predict_n_grams(input$txtSentence)
    )
  })
})
