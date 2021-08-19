#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(DT)
library(pals)
library(dplyr)
library(shiny)
library(plotly)
library(forcats)
library(ggplot2)
library(leaflet)
library(RColorBrewer)
library(shinycustomloader)

# Design of the user interface.
ui <- fluidPage(
   
	# CSS of the UI.
	tags$style(
		HTML(
			"body{
				background-color: black;
			}

			#mainHeading{
				height: 50px;
				color: #ffcc99;
				font-size: 43px;
				font-style: bold;
				text-align: center;
			}

			#jfk{
				color: #98ff98;
				border-radius: 15px;
				border: 3px solid #98ff98;
			}

			#ewr{
				color: #88d8c0;
				border-radius: 15px;
				border: 3px solid #88d8c0;
			}

			#lga{
				color: #b2ec5d;
				border-radius: 15px;
				border: 3px solid #b2ec5d;
			}

			#table{
				color: #c0c0c0;
				font-size: 16px; 
			}

			table.dataTable thead tr{
				color: #deb887;
			}

			table.dataTable tr.selected td{
				background-color: #006400 !important;
			}

			.tabbable > .nav > li > a {
				color: #6495ed;
				padding-left: 25px;
				padding-right: 25px;
				border-top: 2px solid #367588;
				border-left: 5px solid #367588;
				border-right: 5px solid #367588;
			}

			.tabbable > .nav > li[class=active] > a{
				color: #324ab2;
				background-color: #faf0e6; 
			}

			.dataTables_wrapper .dataTables_length,
			.dataTables_wrapper .dataTables_filter,
			.dataTables_wrapper .dataTables_info,
			.dataTables_wrapper .dataTables_paginate{
				color: #e3ab57;
			}

			.dataTables_wrapper .dataTables_length select{
				color: #c46210;
			}

			.dataTables_wrapper .dataTables_filter input{
				color: #c46210;
				border-radius: 7px;
				border: 2px solid #e3ab57;
			}

			.dataTables_wrapper .dataTables_paginate .paginate_button{
				*cursor: hand;
				border-radius: 6px;
				color: #e3ab57 !important;
				text-decoration: none !important;
			}

			.dataTables_wrapper .dataTables_paginate .paginate_button:hover{
  				border: 1px solid #cc4f4f;
			}

			.dataTables_wrapper .dataTables_paginate .paginate_button.current, 
			.dataTables_wrapper .dataTables_paginate .paginate_button.current:hover{
				color: #e3ab57 !important;
				background: linear-gradient(to bottom, #a9a9a9, #696969);
			}

			#barChartSidebar{
				background: black;
				border: 3px solid #ffcc99;
			}
			
			#barOption1{
 				padding-left: 15px;
 				padding-right: 15px;
				border: 1px dotted #ffcc99; 
			}
			
			#barColor{
				color: white;
				font-size: 18px;
				background-color: black;
			}
			
			#barOption2{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#barOrder{
				color: white;
				font-size: 18px;
				background-color: black;
			}

			#pieChartSidebar{
				background: black;
				border: 3px solid #ffcc99;
			}

			#pieOption1{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}

			#pieData{
				color: white;
				font-size: 18px;
				background-color: black;	
			}

			#pieOption2{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#pieColor{
				color: white;
				font-size: 18px;
				background-color: black;	
			}
			
			#pieOption3{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#pieShape{
				color: white;
				font-size: 18px;
				background-color: black;				
			}
			
			#pieOption4{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#lineGraphSidebar{
				background: black;
				border: 3px solid #ffcc99;
			}
	
			#lineOption1{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#lineColor{
				color: white;
				font-size: 16px;
				background-color: black;
			}
						
			#lineOption2{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
						
			#lineOption3{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#lineShape{
				color: white;
				font-size: 16px;
				background-color: black;				
			}

			#pointOption1{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#pointOption2{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#pointColor{
				color: white;
				font-size: 16px;
				background-color: black;	
			}
			
			#pointOption3{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
					
			#pointOption4{
				padding-left: 15px;
				padding-right: 15px;
				border: 1px dotted #ffcc99;
			}
			
			#pointShape{
				color: white;
				font-size: 16px;
				background-color: black;
			}

			.irs-bar{
				width: 100%;
				background: #ff7f50;
				border: 1px solid #ffa07a;
			}

			.irs-bar-edge{
				background: #ff7f50;
				border-top: 1px solid #ffa07a;
				border-left: 1px solid #ffa07a;
				border-bottom: 1px solid #ffa07a;
			}

			.irs-line{
				border: 1px solid #ffcc99;
			}
			
			.irs-grid-text{
				color: white;
				font-size: 12px;
			}

			.irs-min{
				color: #ffcc99;
				font-size: 13px;
				background: #555555;
			}
			
			.irs-max{
				color: #ffcc99;
				font-size: 13px;
				background: #555555;
			}
			
			.irs-single{
				color: #ffcc99;
				font-size: 10px;
				background: #555555;
				border: 1px solid tomato;
			}
			
			.irs-slider{
				top: 20px;
				width: 18px;
				height: 18px;
				background: #555555;
				border: 2px solid tomato;
			}"
      )
   ),
   
   # Name of the web app.
   tags$head(HTML("<title>Flight Delays Dataset and Graphs</title>")),
   
   # Title.
   titlePanel(h1(id = "mainHeading", icon("plane-departure"), "Flight Delays in three airports: JFK, EWR, and LGA", icon("plane-arrival"))),
      
   # All tabs.
   # By default, the first tab will be selected.
	tabsetPanel(id = "alltabs",
		selected = NULL,

		# First Tab.
		tabPanel(id = "tab1_allimages", tags$h2("Images", icon("image")),
			br(),
			br(),

			# Images of the airports.
			tags$div(id = "images",
				fluidRow(
					column(id = "jfk", align = "center", width = 4,
						br(),
						img(src = 'jfk1.png', alt = "JFK airport logo", width = 400, height = 200),
						br(),
						br(),
						img(src = 'jfk2.png', alt = "JFK airport", width = 400, height = 300),
						br(),
						br(),
						h3(tags$b("Location: ", style = "color: #50c878"), "Queens, New York City, U.S."),
						h3(tags$b("Opened: ", style = "color: #50c878"), "July 1, 1948")
					),
					
					column(id = "ewr", align = "center", width = 4,
						br(),
						img(src = 'ewr1.png', alt = "EWR airport logo", width = 400, height = 200),
						br(),
						br(),
						img(src = 'ewr2.png', alt = "EWR airport", width = 400, height = 300),
						br(),
						br(),
						h3(tags$b("Location: ", style = "color: #43b3ae"), "Newark and Elizabeth, New Jersey, U.S."),
						h3(tags$b("Opened: ", style = "color: #43b3ae"), "October 1, 1928")
					),
					
					column(id = "lga", align = "center", width = 4,
						br(),
						img(src = 'lga1.png', alt = "LGA airport logo", width = 400, height = 200),
						br(),
						br(),
						img(src = 'lga2.png', alt = "LGA airport", width = 400, height = 300),
						br(),
						br(),
						h3(tags$b("Location: ", style = "color: #8bbe1b"), "East Elmhurst, Queens"),
						h3(tags$b("Opened: ", style = "color: #8bbe1b"), "December 2, 1939")
					)
				)
			),

			br(),
			br(),

			leaflet(height = 800) %>% addTiles() %>% setView(-74.00597, 40.71427, 11) %>%
			addMarkers(
				lng = -73.780968, 
				lat = 40.641766,
				label = "JFK Airport",
				labelOptions = labelOptions(noHide = T, direction = "bottom",
					style = list(
						"color" = "#3cb371",
						"font-family" = "serif",
						"font-style" = "bold",
						"font-size" = "22px",
						"border" = "5px solid #3cb371"
					)
				)
			) %>%
			addMarkers(
				lng = -74.175,
				lat = 40.6897222222,
				label = "EWR Airport",
				labelOptions = labelOptions(noHide = T, direction = "bottom",
					style = list(
						"color" = "#43b3ae",
						"font-family" = "serif",
						"font-style" = "bold",
						"font-size" = "22px",
						"border" = "5px solid #43b3ae"
					)
				)
			) %>%
			addMarkers(
				lng = -73.8719444444,
				lat = 40.7747222222,
				label = "LGA Airport",
				labelOptions = labelOptions(noHide = T, Direction = "bottom",
					style = list(
						"color" = "#8bbe1b",
						"font-family" = "serif",
						"font-style" = "bold",
						"font-size" = "22px",
						"border" = "5px solid #8bb31b"
					)
				)
			)
		),

      # Second Tab.
		tabPanel(id = "tab2_dataset", tags$h2("Dataset", icon("table")),
			withLoader(DT::dataTableOutput("table"), type = "image", loader = "loading1.gif"),
			downloadButton(outputId = "dlData", label = "Download.csv", icon = shiny::icon("download"))
		),

      # Third Tab.
		tabPanel(id = "tab3_barchart", tags$h2("Bar Chart", icon("chart-bar")), 

			br(),

         sidebarLayout(

				# Bar Chart Options. 
				sidebarPanel(id = "barChartSidebar",

					# Choose a color palette.
					# User can change the colors of the bars.
					tags$div(id = "barOption1", 
						selectInput("barColor", tags$h3("Please pick a color palette:", style = "font-size: 22px; color: #ffcc99"),
							c("Default" = "d", "Palette 1" = "bar1", "Palette 2" = "bar2", "Palette 3" = "bar3", 
								"Palette 4" = "bar4", "Palette 5" = "bar5", "Palette 6" = "bar6"),
							selected = "d",
							selectize = FALSE,
							multiple = FALSE)
					),

					br(),
					br(),

					# Choose the order of the bars.
					# User can choose default(no order), sort from low to high, or sort from high to low.
					tags$div(id = "barOption2",
						selectInput("barOrder", tags$h3("Please choose the order of the bars:", style = "font-size: 22px; color: #ffcc99"),
							c("Default" = "de", "Sort from low to high" = "lth", "Sort from high to low" = "htl"),
							selected = "de",
							selectize = FALSE,
							multiple = FALSE)
					)
         	),			

				# Bar Chart.	
            mainPanel(withLoader(plotlyOutput("bar"), type = "image", loader = "loading2.gif"))
			)
		),

      # Fourth Tab.
		tabPanel(id = "tab4_piechart", tags$h2("Pie Chart", icon("chart-pie")), 
			
			br(),

			sidebarLayout(

				# Bar Chart Options.
				sidebarPanel(id = "pieChartSidebar",
					
					# Choose a variable to be used for the pie chart.
					# Users can choose either departure airports or arrival airports.
					tags$div(id = "pieOption1",
						selectInput("pieData", tags$h3("Please select a variable:", style = "font-size: 22px; color: #ffcc99"),
							c("Departure Airports" = "depart", "Arrival Airports" = "arrive"),
							selected = "depart",
							selectize = FALSE,
							multiple = FALSE)
					),

					br(),
					br(),

					# Choose a color palette.
					# User can change the colors of the slices.
					tags$div(id = "pieOption2",
						selectInput("pieColor", tags$h3("Please pick a color palette:", style = "font-size: 22px; color: #ffcc99"),
							c("Default" = "defaultColor", "Palette 1" = "pie1","Palette 2" = "pie2", "Palette 3" = "pie3", "Palette 4" = "pie4"),
							selected = "defaultColor",
							selectize = FALSE,
							multiple = FALSE)
					),

					br(),
					br(),

					# Choose the shape of the chart.
					# User can choose either a regular pie chart or a donut chart.
					tags$div(id = "pieOption3", 
						selectInput("pieShape", tags$h3("Please select a shape:", style = "font-size: 22px; color: #ffcc99"),
							c("Default(Pie Chart)" = "regularChart", "Donut Chart" = "donutChart"),
							selected = "regularChart",
							selectize = FALSE,
							multiple = FALSE)
					),

					br(),
					br(),

					# Choose the outline style of the chart.
					# User can choose to add a border around each slice or no-border at all. 
					tags$div(id = "pieOption4",
						radioButtons("pieBorder", tags$h3("Please choose one of the outline options:", style = "font-size: 22px; color: #ffcc99"),
							choiceNames = list(
								tags$div(id = "border1", "With Border",
									style = "font-size: 18px; color: white"), 
								tags$div(id = "border0", "Without Border",
									style = "font-size: 18px; color: white")
							),
							choiceValues = list("withBorder", "noBorder"),
							selected = "withBorder",
							inline = TRUE)
					)
				),

				# Pie Chart.
				mainPanel(withLoader(plotlyOutput("pie"), type = "image", loader = "loading2.gif"))
			)
		),

      # Fifth Tab.
		tabPanel(id = "tab5_linegraph", tags$h2("Line Graph", icon("chart-line")),
		shinyFeedback::useShinyFeedback(),

			br(),

			sidebarLayout(

				# Line Graph Options.
				sidebarPanel(id = "lineGraphSidebar",

					# Options of the line.
					tags$div(id = "lineOptions",		
						tags$h2("Line:", style = "color: #ffcc99"),	

						# Choose the line's color.
						# User can change the color of the line.	
						tags$div(id = "lineOption1",
							selectInput("lineColor", tags$h3("Please pick a color:", style = "font-size: 20px; color: #ffcc99"),
								c("Red" = "lineRed", "Orange" = "lineOrange", "Yellow" = "lineYellow", 
									"Green" = "lineGreen", "Blue" = "lineBlue", "Purple" = "linePurple"),
								selected = "colorRed",
								selectize = FALSE,
								multiple = FALSE)
						),

						# Choose the line's width.
						# User can change the width of the line.
						tags$div(id = "lineOption2",
							sliderInput("lineWidth", tags$h3("Please choose a size:", style = "font-size: 20px; color: #ffcc99"),
								min = 0.5, max = 2, value = 1, step = 0.5)
						),

						# Choose the line's shape.
						# User can choose one of the following styles: solid line, dash line, dotted line.
						tags$div(id = "lineOption3",
							selectInput("lineShape", tags$h3("Please select a shape:", style = "font-size: 20px; color: #ffcc99"),
								c("Solid _____" = "solidLine", "Dashed --------" = "dashedLine", "Dotted '''''''''''''" = "dottedLine"),
								selected = "solidLine",
								selectize = FALSE,
								multiple = FALSE)
						)
					)
				),

				# Line Graph.
				mainPanel(withLoader(plotlyOutput("line"), type = "image", loader = "loading2.gif"))
			),

			hr(style = "border-top: 3px solid #ffcc99"),

			tags$h2("Point:", style = "color: #ffcc99"),

			# Options of the point.
			fluidRow(id = "pointOptions",
				column(width = 3,
					# User can choose to add data points to the line or no data points at all.
					tags$div(id = "pointOption1",
						radioButtons("dataPoints","",
							choiceNames = list(
								tags$div(id = "points1", "With Data Points",
									style = "font-size: 18px; color: white"),
								tags$div(id = "points0", "Without Data Points",
									style = "font-size: 18px; color: white")
							),
							choiceValues = list("withDataPoints", "withoutDataPoints"),
							selected = "withDataPoints")
					)
				),

				column(width = 3,
					# Only Show this panel when user choose to add data points to the line.
					conditionalPanel(
						condition = "input.dataPoints == 'withDataPoints'",

						# Choose the point's color.
						# User can change the color of the point.
						tags$div(id = "pointOption2",
							selectInput("pointColor", tags$h3("Please pick a color:", style = "font-size: 20px; color: #ffcc99"),
								c("Red" = "pointRed", "Orange" = "pointOrange", "Yellow" = "pointYellow",
									"Green" = "pointGreen", "Blue" = "pointBlue", "Purple" = "pointPurple"),
								selected = "pointOrange",
								selectize = FALSE,
								multiple = FALSE)
						)
					)
				),

				column(width = 3,
					# Only Show this panel when user choose to add data points to the line.
					conditionalPanel(
						condition = "input.dataPoints == 'withDataPoints'",

						# Choose the point's size.
						# User can change the size of the point.
						tags$div(id = "pointOption3",
							sliderInput("pointSize", tags$h3("Please choose a size:", style = "font-size: 20px; color: #ffcc99"),
								min = 1, max = 4, value = 2, step = 1)
						)
					)
				),

				column(width = 3,
					# Only Show this panel when user choose to add data points to the line.
					conditionalPanel(
						condition = "input.dataPoints == 'withDataPoints'",

						# Choose the point's shape.
						# User can change the shape of the point.
						tags$div(id = "pointOption4", 
							selectInput("pointShape", tags$h3("Please select a shape:", style = "font-size: 20px; color: #ffcc99"),
								c("Circle" = "pointCircle", "Square" = "pointSquare", "Triangle" = "pointTriangle"),
								selected = "pointCircle",
								selectize = FALSE,
								multiple = FALSE)							
						)
					)				
				)
			)
		)
	)  
)

# Server of the web app.
server <- function(input, output) {

   # Read the file.
   mydata <- reactive({
      read.csv("dataset.csv")
   }) 
  
   # Show the dataset.
   output$table <- DT::renderDataTable({
      DT::datatable(
			mydata(),
			options = list(
				searchHighlight = TRUE, 
				lengthMenu = c(10, 20, 30, 40)
			),
			selection = "single", # Enable single row selection.
      	filter = "top") %>% 
			formatStyle(
				all(),
				backgroundColor = "black"
			)	
   })

	# Download dataset.
	output$dlData <- downloadHandler(
		filename = function(){
			paste("flightDelay", ".csv", sep = "")
		},
		content = function(file){
			write.csv(mydata(), file, row.names = FALSE)
		}
	)

	# Get Bar Color.
	barChartColor <- reactive({
		if(input$barColor == "bar1"){
			scale_fill_manual(values = as.vector(alphabet(16)))
		} else if(input$barColor == "bar2"){
			scale_fill_manual(values = as.vector(alphabet2(16)))
		} else if(input$barColor == "bar3"){
			scale_fill_manual(values = as.vector(cols25(16)))
		} else if(input$barColor == "bar4"){
			scale_fill_manual(values = as.vector(polychrome(16)))
		} else if(input$barColor == "bar5"){
			scale_fill_manual(values = as.vector(stepped(16)))
		} else if(input$barColor == "bar6"){
			scale_fill_manual(values = as.vector(glasbey(16)))
		} 
	})

	# Get Bar Order.
	barChartOrder <- reactive({
		if(input$barOrder == "lth"){	# low to high
			aes(x = forcats::fct_rev(forcats::fct_infreq(carrier)), fill = carrier)
		} else if(input$barOrder == "htl"){	# high to low
			aes(x = forcats::fct_infreq(carrier), fill = carrier)
		} else{
			aes(x = carrier, fill = carrier)
		}
	})

   # Show the Bar Chart.
	output$bar <- renderPlotly({
		ggplot(mydata(), barChartOrder()) + 
         geom_bar(stat = "count") +
         labs(title = "Delayed Flights of different airlines in JFK, EWR, and LGA airports", 
				fill = "Airline",
				x = "Airlines",
				y = "Count") + 
			barChartColor() +
         theme(plot.title = element_text(size = 17, face = "bold", color = "white"),
				plot.background = element_rect(fill = "black"),
				panel.background = element_rect(fill = "black"),
				panel.border = element_rect(color = "white", fill = NA, size = 2),
				axis.text = element_text(color = "white", size = 12),
				axis.title = element_text(color = "white", size = 17),
				legend.background = element_rect(fill = "#4f4f4f", color = "white"),
				legend.title = element_text(color = "white", size = 13),
				legend.text = element_text(color = "white", size = 10)
         ) 
	})

	# Get Pie Chart Data.
	pieChartData <- reactive({
		if(input$pieData == "depart"){	# departure airports
			pieSubsetData1 <- as.data.frame(table(mydata()$origin))
			colnames(pieSubsetData1)[1] <- "origin"
			colnames(pieSubsetData1)[2] <- "count"
			pieSubsetData1
		} else if(input$pieData == "arrive"){	# arrival airports
			pieSubsetData2 <- as.data.frame(table(mydata()$dest))
			colnames(pieSubsetData2)[1] <- "destination"
			colnames(pieSubsetData2)[2] <- "count"

			# SubsetData2 would create a pie chart containing more than 50 slices.
			# A modified SubsetData2 would group some of the smaller slices together into one group called 'Others'.
			i <- 1
			new_col <- vector()
			while(i <= nrow(pieSubsetData2)){
				# Any destination airports with less than 400 delays will be grouped together.
				if(pieSubsetData2[i, 2] < 400){	
					new_col[i] <- "Others"
				} else{
					new_col[i] <- toString(pieSubsetData2[i, 1])
				}
				i <- i + 1
			}
			pieSubsetData2$destination_modified <- new_col
			pieSubsetData2
		}
	})

	# Get Pie Chart Color.
	pieChartColor <- reactive({
		if(input$pieColor == "pie1"){
			palette1 <- c("#91B0A4", "#E5E5BF", "#A5C3E9", "#CDB199", "#DBC3F2",
								"#DAE3AA", "#C5D8D3", "#5B695D", "#96858F", "#D5DFF4",
								"#BBBBBB", "#A9D8B8", "#F1C6B8", "#E5E9EC", "#797D9B",
								"#E09075", "#69995D", "#C2C347", "#99E1D9", "#D86499",
								"#BD8748", "#BD8DBF", "#E7D4B5", "#6EB68C", "#F2DE4D",
								"#FFF1E6", "#FF758F", "#90BE6D", "#DEE2FF", "#4CC9F0",
								"#FADA5E", "#9ACD32", "#006400", "#00FA9A", "#FFCFF1")
		}  else if(input$pieColor == "pie2"){
			palette2 <- c("aquamarine", "aliceblue", "azure1", "bisque3", "brown2",
								"burlywood1", "cadetblue2", "chocolate1", "chartreuse1", "coral",
								"cholocate4", "cornflowerblue", "cyan4", "gold1", "gray30", 
								"green2", "greenyellow", "ivory3", "lightpink", "maroon2",
								"mistyrose4", "orchid3", "peachpuff1", "rosybrown3", "seashell2",
								"seashell3", "sienna3", "skyblue2", "slateblue4", "slategray3",
								"springgreen2", "springgreen4", "tan3", "violetred1", "wheat3")
		} else if(input$pieColor == "pie3"){
			palette3 <- c("lightpink1", "lightgreen", "#39FF14", "lightcyan2", "lightcoral",
								"lawngreen", "indianred1", "hotpink2", "midnightblue", "mediumseagreen",
								"mediumpurple2", "maroon", "magneta1", "lightsalmon4", "palegreen3",
								"orangered1", "orange2", "olivedrab", "navy", "royalblue1",
								"plum2", "yellow3", "snow4", "thistle1", "yellowgreen", 
								"red", "black", "90BE6D", "C0FDFF", "5A189A",
								"#E56B6F", "#2EC4B6", "#4CC9F0", "#FEEAFA", "#708D81")
		} else if(input$pieColor == "pie4"){
			palette4 <- c("#03045E", "#023E8A", "#0077B6", "#0096C7", "#00B4D8",
								"#48CAE4", "#90E0EF", "#ADE8F4", "#CAF0F8", "#FFBF00",
								"#FFBA08", "#FAA307", "#F48C06", "#E85D04", "#DC2F02",
								"#D00000", "#9D0208", "#F1FAEE", "#370617", "#7F5539",
								"#9C6644", "#B08968", "#DDB892", "#E6CCB2", "#EDE0D4",
								"#D8A0A6", "#70CC00", "#549900", "#2DC2B4", "#1E3463",
								"#9400D3", "#C9FFE5", "#007474", "#F88379", "#6A040F")
		}
	})

	# Get Pie Chart Border Width.
	pieChartBorder <- reactive({
		if(input$pieBorder == "withBorder"){
			border <- list(color = "white", width = 2)
		} else if(input$pieBorder == "noBorder"){
			border <- list(color = "black", width = 0)
		}
	})

	# Get Pie Chart Shape.
	pieChartShape <- reactive({
		if(input$pieShape == "regularChart"){
			hole <- 0
		} else if(input$pieShape == "donutChart"){
			hole <- 0.6
		}
	})

	# Show the Pie Chart.
	output$pie <- renderPlotly({

		# Pie Chart for departure airports.
		if(input$pieData == "depart"){
			fig <- plot_ly(pieChartData(), labels = ~origin, values = ~count, type = "pie",

				# Style of the text contained in each slice.
				textposition = "inside",	
				textinfo = "label+percent",
				insidetextfont = list(size = 14),

				# Style of each slice.
				marker = list(	
					colors = pieChartColor(),	# The colors of the slices.
					line = pieChartBorder()	# The line that separates each slice.
				),

				# Transform the chart into a donut chart.
				hole = pieChartShape()

			) %>% layout(
				title = list( 
					text = "Flight Delays by departure airports in January, 2013",
					font = list(
						size = 16,
						color = "white"
					)
				),

				# Pie Chart's Legend.
				legend = list(	
					# Legend's title.
					title = list(	
						text = "Airports",
						font = list(
							size = 14,
							color = "white"
						)
					),

					# Legend's info.
					font = list(	
						size = 12,
						color = "white"
					),		

					# Legend Style.			
					borderwidth = 1,
					bgcolor = "#4f4f4f",
					bordercolor = "white"
				),

				# Hide the X-axis and Y-axis.
				xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
				yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),

				# Set Pie Chart's background color to black.
				paper_bgcolor = "black"
			)

		} else if(input$pieData == "arrive"){	# Pie Chart for arrival airports.
			fig <- plot_ly(pieChartData(), labels = ~destination_modified, values = ~count, type = "pie",

				# Style of the text contained in each slice.
				textposition = "inside",	
				textinfo = "label+percent",
				insidetextfont = list(size = 14),

				# Style of each slice.
				marker = list(	
					colors = pieChartColor(),	# The colors of the slices.
					line = pieChartBorder()	# The line that separates each slice.
				),

				# Transform the chart into a donut chart.
				hole = pieChartShape()

			) %>% layout(
				title = list( 
					text = "Flight Delays by arrival airports in January, 2013",
					font = list(
						size = 16,
						color = "white"
					)
				),

				# Pie Chart's Legend.
				legend = list(	
					# Legend's title.
					title = list(	
						text = "Airports",
						font = list(
							size = 14,
							color = "white"
						)
					),

					# Legend's info.
					font = list(	
						size = 12,
						color = "white"
					),		

					# Legend Style.			
					borderwidth = 1,
					bgcolor = "#4f4f4f",
					bordercolor = "white"
				),

				# Hide the X-axis and Y-axis.
				xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
				yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),				

				# Set Pie Chart's background color to black.
				paper_bgcolor = "black"				
			)
		}
		fig
	})

	# Get Line Graph Data.
	lineGraphData <- reactive({
		lineSubsetData <- as.data.frame(table(mydata()$day))
		colnames(lineSubsetData)[1] <- "day"
		colnames(lineSubsetData)[2] <- "count"
		lineSubsetData
	})

	# Get Line Color.
	lineGraphLineColor <- reactive({
		if(input$lineColor == "lineRed"){
			lColor <- "red2"
		} else if(input$lineColor == "lineOrange"){
			lColor <- "orange2"
		} else if(input$lineColor == "lineYellow"){
			lColor <- "yellow2"
		} else if(input$lineColor == "lineGreen"){
			lColor <- "green2"
		} else if(input$lineColor == "lineBlue"){
			lColor <- "skyblue2"
		} else if(input$lineColor == "linePurple"){
			lColor <- "purple2"
		}
	})

	# Get Line Width.
	lineGraphLineWidth <- reactive({
		lSize <- input$lineWidth
	})

	# Get Line Shape.
	lineGraphLineShape <- reactive({
		if(input$lineShape == "solidLine"){
			lShape <- "solid" 
		} else if(input$lineShape == "dashedLine"){
			lShape <- "dashed"
		} else if(input$lineShape == "dottedLine"){
			lShape <- "dotted"
		}
	})

	# Get Point Color.
	lineGraphPointColor <- reactive({
		if(input$pointColor == "pointRed"){
			pColor <- "red2"
		} else if(input$pointColor == "pointOrange"){
			pColor <- "orange2"
		} else if(input$pointColor == "pointYellow"){
			pColor <- "yellow2"
		} else if(input$pointColor == "pointGreen"){
			pColor <- "green2"
		} else if(input$pointColor == "pointBlue"){
			pColor <- "skyblue2"
		} else if(input$pointColor == "pointPurple"){
			pColor <- "purple2"
		}
	})

	# Get Point Size.
	lineGraphPointSize <- reactive({
		pSize <- input$pointSize
	})

	# Get Point Shape.
	lineGraphPointShape <- reactive({
		if(input$pointShape == "pointCircle"){
			pShape <- 16
		} else if(input$pointShape == "pointSquare"){
			pShape <- 15
		} else if(input$pointShape == "pointTriangle"){
			pShape <- 17
		}
	})

	# Get Point.
	lineGraphPoint <- reactive({
		if(input$dataPoints == "withDataPoints"){
			geom_point(color = lineGraphPointColor(), size = lineGraphPointSize(), shape = lineGraphPointShape())
		}
	})

	# Show the Line Graph.
	output$line <- renderPlotly({
		ggplot(lineGraphData(), aes(x = day, y = count, group = 1)) +
			geom_line(color = lineGraphLineColor(), size = lineGraphLineWidth(), linetype = lineGraphLineShape()) + 
			lineGraphPoint() +
			labs(title = "Delayed Flights from JFK, EWR, and LGA in January, 2013",
				x = "Date",
				y = "Count") +
			theme(plot.title = element_text(size = 17, face = "bold", color = "white"),
				plot.background = element_rect(fill = "black"),
				panel.background = element_rect(fill = "black"),
				axis.title = element_text(color = "white", size = 13),
				axis.text.x = element_text(color = "white", angle = 30, hjust = 1),
				axis.text.y = element_text(color = "white")
			)
	})
}

# Run the application.
shinyApp(ui = ui, server = server)