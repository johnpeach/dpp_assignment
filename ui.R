library(shiny)
library(datasets)
step.length <- 1000
#iris <- datasets::iris
shinyUI( pageWithSidebar(
   headerPanel('Predict Iris Species'),
   sidebarPanel(
      h2('Task'),
      p('A decision tree model has been created to classify the species of an iris based
         on the sepal and petal length and width.  Use the sliders to change the parameters
         and see if you reverse engineer the model.'),
      h2('Specimen Charteristics'),
      sliderInput('Petal.Length', 'Petal Length:', mean(iris$Petal.Length), 
                  min = min(iris$Petal.Length), max = max(iris$Petal.Length), 
                  step = (max(iris$Petal.Length) - min(iris$Petal.Length)) / step.length),
      sliderInput('Petal.Width', 'Petal Width:', mean(iris$Petal.Width), 
                  min = min(iris$Petal.Width), max = max(iris$Petal.Width), 
                  step = (max(iris$Petal.Width) - min(iris$Petal.Width)) / step.length),
      sliderInput('Sepal.Length', 'Sepal Length:', mean(iris$Sepal.Length), 
                  min = min(iris$Sepal.Length), max = max(iris$Sepal.Length), 
                  step = (max(iris$Sepal.Length) - min(iris$Sepal.Length)) / step.length),
      sliderInput('Sepal.Width', 'Sepal Width:', mean(iris$Sepal.Width), 
                  min = min(iris$Sepal.Width), max = max(iris$Sepal.Width), 
                  step = (max(iris$Sepal.Width) - min(iris$Sepal.Width)) / step.length)
      
   ),
   mainPanel(
      h2('Model Prediction'),
      verbatimTextOutput('prediction'),
      plotOutput('Petal'),
      plotOutput('Sepal')
   )
))