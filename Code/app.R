library(shiny)
library(ggplot2)


#This is code for shiny app

#This application is main edited by RUI HUANG

#The interface, ggplot and unit part are fixed, edited and maintained by ENZE WANG

#Other problems are fixed by HanGyu KANG and CHENYANG JIANG

ui<-navbarPage('Bodyfat Calculator',inverse = T,collapsible = T,
               tabPanel("Group 2",
                        sidebarLayout(position = "right",
                                      sidebarPanel(
                                        numericInput("Abdomen", "Abdomen circumference:", min = 20, max = 200, value = NA),
                                        selectInput("Abdomenunit", "Abdomen Units:",list("cm" = "cm","inch" = "inch")),
                                        helpText("The value must between 20 to 200 cm (7.87402 to 78.7402 inches)"),
                                        numericInput("Weight", "Weight:", min = 50, max = 550, value = NA),
                                        selectInput("Weightunit", "Weight Units:",list("lbs" = "lbs","kg" = "kg")),
                                        helpText("The value  must between 50 to 550 lbs (22.6796 to 249.476 kg)"),
                                        numericInput("Wrist", "Wrist circumference:", min = 0, max = 100, value = NA),
                                        selectInput("Wristunit", "Wrist Units:",list("cm" = "cm","inch" = "inch")),
                                        helpText("The value must between 4 to 40 cm (1.5748 to 15.748 inches)"),
                                        selectInput("Gender", "Gender:",list("Men" = "Men","Women" = "Women")),
                                        helpText("The gender is not necessary for our model prediction, but for bodyfat suggestion"),
                                        actionButton("calculate",label = "Submit",icon=icon('angle-double-right'))
                                      ),
                                      mainPanel(tabsetPanel(
                                        tabPanel("What's Your Bodyfat",h1("Your body fat is:"),textOutput("results"),
                                        tags$style("#results {font-size:36px;}"),
                                        textOutput("warning"),
                                        plotOutput(outputId="PiePlot"),h1("Suggestion:"),textOutput("suggestion"),style = "font-size:120%"),
                                        tabPanel("Acknowledgements",h1("Questions:"),htmlOutput("Questions"),h1("Acknowledgements:"),htmlOutput("Acknowledgements"), 
                                                 style = "font-size:120%")
                                      )
                                      
                                      ))
))

server<-shinyServer(function(input, output) {
  #model = lm(formula = BODYFAT ~ ABDOMEN + WEIGHT + WRIST, data = data)
  
  
  k = c(-24.22925,0.87792,-0.08384,-1.26116)
  
  
  outcome <- reactive({
    
    if(input$Abdomenunit=="inch"){
      ABDOMEN=input$Abdomen*2.54
    }else{
      ABDOMEN=input$Abdomen
    }
    
    if(input$Weightunit=="kg"){
      WEIGHT=input$Weight*2.20462
    }else{
      WEIGHT=input$Weight
    }
    
    if(input$Wristunit=="inch"){
      WRIST=input$Wrist*2.54
    }else{
      WRIST=input$Wrist
    }
    
    d = c(1,ABDOMEN,WEIGHT,WRIST)
    bodyfat=as.numeric(round(k%*%d))
    if (is.na(d[2]) == TRUE | is.na(d[3]) == TRUE | is.na(d[4]) == TRUE){
      outcome = "Please input your data"
    }
    else if (d[2] < 20 | d[2] > 200 | d[3] < 50 | d[3] > 550
             | d[4] < 4 | d[4] > 40){
      outcome = "Input Error 1"
    }
    else if(bodyfat<0 | bodyfat>60){
      outcome = "Input Error 2"
    }
    else{
      outcome = bodyfat
    }
    outcome
  })
  

  
  output$results <- renderText({
      if(outcome()!="Input Error 1" & outcome()!="Input Error 2" & outcome()!="Please input your data"){
        paste(outcome(),"%")
      }
  })
  
  output$warning <- renderText({
    if(outcome()=="Input Error 1"){
      paste("Be careful our application does not allow extreme input values. It seems that your input is out of normal range. Please check your input")
    }else if(outcome()=="Input Error 2"){
      paste("Be careful our application does not allow bodyfat to be smaller than 0% and larger than 60%. It seems that your output is out of normal range. Please check your input")
    }else if(outcome()=="Please input your data"){
      paste("Please input your data")
    }else{}
  })
  
  
  
  output$suggestion <- renderText({
    if(outcome()!="Input Error 1" & outcome()!="Input Error 2" & outcome()!="Please input your data"){
      BODYFAT=outcome()
        if((BODYFAT<5 & input$Gender=="Men") | (BODYFAT<13 & input$Gender=="Women")){
          paste("According to the American Council on Exercise, your body fat falls into the essential body fat range, essential fat is the minimum amount of fat for your daily physical health, it is unhealthy to stay here")
        }else if((BODYFAT<13 & input$Gender=="Men") | (BODYFAT<20 & input$Gender=="Women")){
          paste("According to the American Council on Exercise, your body fat is in athletes range, please keep exercise and healthy diet")
        }else if((BODYFAT<17 & input$Gender=="Men") | (BODYFAT<24 & input$Gender=="Women")){
          paste("According to the American Council on Exercise, your body fat is in fitness range, please keep more exercise and healthier diet")
        }else if((BODYFAT<24 & input$Gender=="Men") | (BODYFAT<31 & input$Gender=="Women")){
          paste("According to the American Council on Exercise, your body fat is in acceptable range, you can pay attention to your physical exercise and avoid junk food")
        }else{
          paste("According to the American Council on Exercise, your body fat is in obesity range, please keep away from junk food, exercise everyday and monitor your own weight. If necessary, you should ask doctors for more advice")
        }

        
  }
  })
  
  output$PiePlot <- renderPlot({
    if(outcome()!="Input Error 1" & outcome()!="Input Error 2" & outcome()!="Please input your data"){
      BODYFAT=outcome()
      Color="#45FC00"
      if(BODYFAT<5){
        Color="#FCFC00"  
      }else if(BODYFAT<10){
        Color="#00FC2A"  
      }else if(BODYFAT<15){
        Color="#50FC00" 
      }else if(BODYFAT<20){
        Color="#C3FC00"
      }else if(BODYFAT<25){
        Color="#FCF400"
      }else if(BODYFAT<30){
        Color="#FCB300"
      }else{
        Color="#FC0000"
      }
      BodyPart=c("Other",paste("Bodyfat:",BODYFAT,"%"))
      BodyPartPercentage=c(100-BODYFAT,BODYFAT)
      df=data.frame(BodyPart,BodyPartPercentage)
      ggplot(df, aes(x="", y=BodyPartPercentage, fill=BodyPart))+
        geom_bar(stat="identity", width=1, color="white") +
        theme(axis.text.x=element_blank()) +
        scale_fill_manual(values=c(Color, "#00FCE9"))+
        coord_polar("y", start=0) +
        theme_minimal()+
        theme(
          axis.title.x = element_blank(),
          axis.title.y = element_blank(),
          panel.border = element_blank(),
          panel.grid=element_blank(),
          axis.ticks = element_blank(),
          plot.title=element_text(size=30, face="bold")
        ) 
    }
  })
  
  output$Questions <- renderUI({
    HTML('<br>
          If you have any questions, please contact: <br> 
          <br>
          CHENYANG JIANG cjiang77@wisc.edu<br> 
          <br>
          HanGyu KANG hkang98@wisc.edu<br> 
          <br>
          ENZE WANG ewang36@wisc.edu<br> 
          <br>
          RUI HUANG rhuang95@wisc.edu')
  })
  
  output$Acknowledgements <- renderUI({
    HTML('
          <br>
          This application is for Bodyfat subjects<br>
          <br>
          This subject want to predict Bodyfat with your body data<br>
          <br>
          More information can be found in our group github: https://github.com/moslandwez/Module_2 <br>
          <br>
          The bodyfat suggestion is given by the American Council on Exercise website: https://www.acefitness.org/<br>
          <br>
          This application is main edited by RUI HUANG <br> 
          <br>
          The interface, ggplot and unit part are fixed, edited and maintained by ENZE WANG <br> 
          <br>
          Other problems are fixed by HanGyu KANG and CHENYANG JIANG')
  })


})

shinyApp(ui = ui, server = server)

