library(shiny)
library(datasets)
library(rpart)
library(ggplot2)
shinyServer(
   function(input, output) { 
      model <- rpart(Species ~ ., data = datasets::iris)
      output$prediction <- renderText( levels(iris$Species)[predict( 
                                               model, 
                                               data.frame( Sepal.Length = input$Sepal.Length,
                                                           Sepal.Width  = input$Sepal.Width,
                                                           Petal.Length = input$Petal.Length,
                                                           Petal.Width  = input$Petal.Width ),
                                               type = "class"
                                               )]
                                    )
      output$Sepal <- renderPlot( ggplot(datasets::iris, aes(x = Sepal.Width, y = Sepal.Length, colour = Species)) +
                                     geom_point() + 
                                     geom_vline(xintercept = input$Sepal.Width) +
                                     geom_hline(yintercept = input$Sepal.Length)
         
      )
      output$Petal <- renderPlot( ggplot(datasets::iris, aes(x = Petal.Width, y = Petal.Length, colour = Species)) +
                                     geom_point() + 
                                     geom_vline(xintercept = input$Petal.Width) +
                                     geom_hline(yintercept = input$Petal.Length)
         
      )
         
   }
)