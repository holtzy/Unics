#####################
#
#	DEVELOPPEMENT D'UNE APPLI SHINY POUR LA VISUALISATION DES QTLS MOSAIQUES ET FUSA
#
####################





# Define UI for application that draws every chromosomes with diversity indexes
shinyUI(bootstrapPage(
        
	includeCSS("www/style.css") ,




 	# -------------------------------------------------------------------------------------
	# === 1/ Row article title
	fluidRow(align="center",
		style="opacity:0.9; background-color: white ;margin-top: 0px; width: 100%;",
		column(6,offset=3,
			br(),
			img(src="Logo_UNICS.jpg" ,  height = 338, width = 600),
			#img(src="Logo_SUPAGRO.jpg"),# ,  height = 338, width = 600),
			#helpText( "UNICS" , style="color:Orange ; font-family: 'times'; font-size:40pt ; font-type:bold") ,
			#helpText( "UNequal Individual ContributionS" , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			#helpText( "How to optimize the precision of allele and haplotype frequency estimates using pooled-sequencing data" , style="color:Orange ; font-family: 'times'; font-size:30pt ; font-type:bold") ,
			br()
			)
		),
	fluidRow(align="center",
		style="opacity:0.9; background-color: white ;margin-top: 0px; width: 100%;",
		column(6,offset=3,
			helpText( em("A project by Nicolas O. Rode, Yan Holtz, Karine Loridon, Sylvain Santoni, Joëlle Ronfort & Laurène Gay") , style="color:grey ; font-family: 'times'; font-size:13pt ; font-type:italic" ),
			hr()
			)
		),
 	# -------------------------------------------------------------------------------------






 	# -------------------------------------------------------------------------------------
	# === 2/ Explanations
	fluidRow(align="center",
		style="opacity:0.9; background-color: white ;margin-top: 0px; width: 100%;",
		column(3,offset=3, align="justify",
			"Sequencing pools of individuals allows estimating allele frequencies in many populations at a cheaper cost. Theoretical and emPirical studies show that pool- sequencing a limited number of individuals (tyPically fewer than 50) can provide reliable allele frequency estimates, provided that the different experimental factors potentially affecting estimate precision are carefully controlled for. Apart from individual sampling, the precision of frequency",
			br()
			),
		column(3,offset=0, align="justify",
			"is affected by DNA pooling and DNA sequencing. Unequal individual DNA contributions to the DNA pool affect the former, whereas the mean and variance in sequencing depth affect the latter. To our knowledge, no study explicitly distinguishes between these two factors; so that there is currently no method to experimentally estimate the importance of unequal individual DNA contributions without the confoundings of sequencing depth. We develop a ",
			br()
	)), 
	fluidRow(column(6,offset=3,hr())),
	#fluidRow(align="center", actionButton(inputId = "showoption",label = "Show Options?")),
	fluidRow(align="center", radioGroupButtons("showoption",label = "Show options?", choices=c("show"=1,"hide"=2), selected=2)),
	br(),
 	# -------------------------------------------------------------------------------------





	# -------------------------------------------------------------------------------------
	# === 3/ Widgets et graphiques
	fluidRow(align="center",


		# ------- Colonne 1 (Pi)
		column(3,
			helpText( HTML("Allele frequency") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			helpText( HTML("(&pi;)") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold" ),
			
				
			
			# Pi (3 valeurs)
			fluidRow(align="center",
				column(1, dropdownButton(  circle = TRUE, status = "success", icon = icon("question"), width = "300px", "Nico ici explique ce qu'est Pi")),
				column(offset=1,3,textInput("Pi_g1_1", label=strong(HTML("&pi;"),style="color:red"), value=0.1)),
				column(3,textInput("Pi_g1_2", label=strong(HTML("&pi;"),style="color:green"), value=0.25)),
				column(3,textInput("Pi_g1_3", label=strong(HTML("&pi;"),style="color:blue"), value=0.5))
				),
						        		
			column(offset=3,6,hr()),
			
			conditionalPanel("input.showoption == 1",

				# variation de N
				fluidRow(align="center",
					column(5, offset=1, sliderInput("N_g1", label="N (pool)", min=1, max=1000, step=1, value=c(1,200) )),
					column(5, sliderInput("Nind_g1", label="N (ind)", min=1, max=200, value=50 ))
					),
			
				# Lambda
				fluidRow(align="center",
					column(5,offset=1, textInput("LambdaInd_g1", label=HTML("&lambda; (ind)"), value=10)),
					column(5,textInput("LambdaPool_g1", label=HTML("&lambda; (pool)"), value=10))
					),
			
				# Alpha et CV
				fluidRow(align="center",
					column(5,offset=1, textInput("Alpha_g1", label=HTML("&alpha;"), value=0.2)),
					column(5,textInput("CV_g1", label="CV", value=20))
					)
			),
				
		plotOutput("my_plot1A", height = "500px"), 
		br(),
		plotOutput("my_plot1B", height = "500px"),
		br(),br()
		),





		# ------- Colonne 2
		column(3,
			helpText( HTML("Unequal individual DNA") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			helpText( HTML("contribution (CV)") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,

			# CV (3 valeurs)
			fluidRow(align="center",
				column(1, dropdownButton(  circle = TRUE, status = "success", icon = icon("question"), width = "300px", "Nico ici explique ce qu'est CV")),
				column(offset=1,3,textInput("CV_g2_1", label=strong("CV",style="color:red"), value=10)),
				column(3,textInput("CV_g2_2", label=strong("CV",style="color:green"), value=20)),
				column(3,textInput("CV_g2_3", label=strong("CV",style="color:blue"), value=50))        		
				),
			column(offset=3,6,hr()),
			
			conditionalPanel("input.showoption == 1",

				# variation de N
				fluidRow(align="center",
					column(5, offset=1, sliderInput("N_g2", label="N (pool)", min=1, max=1000, step=1, value=c(1,200) )),
					column(5, sliderInput("Nind_g2", label="N (ind)", min=1, max=200, value=50 ))
					),
			
				# Lambda
				fluidRow(align="center",
					column(5,offset=1, textInput("LambdaInd_g2", label=HTML("&lambda; (ind)"), value=10)),
					column(5,textInput("LambdaPool_g2", label=HTML("&lambda; (pool)"), value=10))
					),
			
				# Alpha et CV
				fluidRow(align="center",
					column(5,offset=1, textInput("Alpha_g2", label=HTML("&alpha;"), value=0.2)),
					column(5,textInput("Pi_g2", label=HTML("&pi;"), value=0.25))
					)
			),
				
		plotOutput("my_plot2A", height = "500px"), 
		br(),
		plotOutput("my_plot2B", height = "500px"),
		br(),br()
		),





		# ------- Colonne 3 (alpha)
		column(3,
			helpText( HTML("Dispersion in sequencing") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			helpText( HTML("depth (&alpha;)") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,

			# Alpha (3 valeurs)
			fluidRow(align="center",
				column(1, dropdownButton(  circle = TRUE, status = "success", icon = icon("question"), width = "300px", "Nico ici explique ce qu'est Alpha")),
				column(offset=1,3,textInput("Alpha_g3_1", label=strong(HTML("&alpha;"),style="color:red"), value=0.1)),
				column(3,textInput("Alpha_g3_2", label=strong(HTML("&alpha;"),style="color:green"), value=0.25)),
				column(3,textInput("Alpha_g3_3", label=strong(HTML("&alpha;"),style="color:blue"), value=0.5))        		
				),
			column(offset=3,6,hr()),
			
			conditionalPanel("input.showoption == 1",

				# variation de N
				fluidRow(align="center",
					column(5, offset=1, sliderInput("N_g3", label="N (pool)", min=1, max=1000, step=1, value=c(1,200) )),
					column(5, sliderInput("Nind_g3", label="N (ind)", min=1, max=200, value=50 ))
					),
			
				# Lambda
				fluidRow(align="center",
					column(5,offset=1, textInput("LambdaInd_g3", label=HTML("&lambda; (ind)"), value=10)),
					column(5,textInput("LambdaPool_g3", label=HTML("&lambda; (pool)"), value=10))
					),
			
				# Alpha et CV
				fluidRow(align="center",
					column(5,offset=1, textInput("Pi_g3", label=HTML("&pi;"), value=0.25)),
					column(5,textInput("CV_g3", label="CV", value=20))
					)
			),
				
		plotOutput("my_plot3A", height = "500px"), 
		br(),
		plotOutput("my_plot3B", height = "500px"),
		br(),br()
		),


		
		# ------- Colonne 4 (Lambda)
		column(3,
			helpText( HTML("Average sequencing") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			helpText( HTML("depth (&lambda;)") , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			
			# Lambda (3 valeurs)
			fluidRow(align="center",
				column(1, dropdownButton(  circle = TRUE, status = "success", icon = icon("question"), width = "300px", "Nico ici explique ce qu'est Lambda")),
				column(offset=1,3,textInput("LambdaPool_g4_1", label=strong(HTML("&lambda;"),style="color:red"), value=5)),
				column(3,textInput("LambdaPool_g4_2", label=strong(HTML("&lambda;"),style="color:green"), value=10)),
				column(3,textInput("LambdaPool_g4_3", label=strong(HTML("&lambda;"),style="color:blue"), value=100))        		
				),
			column(offset=3,6,hr()),
			
			conditionalPanel("input.showoption == 1",

				# variation de N
				fluidRow(align="center",
					column(5, offset=1, sliderInput("N_g4", label="N (pool)", min=1, max=1000, step=1, value=c(1,200) )),
					column(5, sliderInput("Nind_g4", label="N (ind)", min=1, max=200, value=50 ))
					),
			
				# Lambda
				fluidRow(align="center",
					column(5,offset=1, textInput("LambdaInd_g4", label=HTML("&lambda; (ind)"), value=10)),
					column(5,textInput("Pi_g4", label=HTML("&pi;"), value=0.2))
					),
			
				# Alpha et CV
				fluidRow(align="center",
					column(5,offset=1, textInput("Alpha_g4", label=HTML("&alpha;"), value=0.2)),
					column(5,textInput("CV_g4", label="CV", value=20))
					)
			),
				
		plotOutput("my_plot4A", height = "500px"), 
		br(),
		plotOutput("my_plot4B", height = "500px"),
		br(),br()
		)


	),
	# -------------------------------------------------------------------------------------





	# -------------------------------------------------------------------------------------
	# === Last bandeau for the logos
	fluidRow(
		
		# Set the style of this page
		style=" opacity: 0.8 ; background-color: black ; margin-top: 0px ; width: 100%; ",
	
		# put the logos
		br(),br(),
		column(4, offset=0, align="center", 
			column(4, img(src="logo_INRA.png" ,  height = 70*grand, width = 120*grand)),
			column(4, img(src="logo_SUPAGRO.jpg" ,  height = 70*grand, width = 130*grand)),
			column(4, img(src="logo_ANR.png" ,  height = 70*grand, width = 140*grand))
			),
		column(4, offset=0,
			helpText(strong("Authors:", style="color:orange ; font-family: 'times'; font-size:15pt ; font-type:bold" ) ) ,
			helpText(
				style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal",
				"Nicolas O. ",a("Rode", style="color:orange", href="https://sites.google.com/site/nicolasorode/"), 
				"Yan",a("Holtz", style="color:orange", href="https://holtzyan.wordpress.com/"), 
				"Karine",a("Loridon", style="color:orange", href="http://umr-agap.cirad.fr/equipes-scientifiques/genomique-evolutive-et-gestion-des-populations/liste-des-agents"), 
				"Sylvain",a("Santoni", style="color:orange", href="http://umr-agap.cirad.fr/equipes-scientifiques/genomique-evolutive-et-gestion-des-populations/liste-des-agents"), 
				"Joëlle",a("Ronfort", style="color:orange", href="http://www1.montpellier.inra.fr/BRC-MTR/mauguio/mauguio.php?page=menu42"), 
				"&"
				),
			helpText(
				"Laurène",a("Gay", style="color:orange", href="https://www.sites.google.com/site/evolutionarybiologylaurenegay/"), 
				"INRA, UMR AGAP, F-34060 Montpellier, France", style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal"
				)
			),
		column(2, offset=0,
			helpText(strong("Contact:", style="color:orange ; font-family: 'times'; font-size:15pt ; font-type:bold" ) ) ,
			helpText("Nicolas Rode: nicolas.o.rode@gmail.com", style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal"),
			helpText("INRA Montpellier, ge2pop team, France", style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal")
			), 
		column(2, offset=0,
			helpText(strong("Links", style="color:orange ; font-family: 'times'; font-size:15pt ; font-type:bold" ) ) ,
			helpText("Read the related publication [in Press]", style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal"),
			
			helpText("Source code is on",a("Github", style="color:orange ; font-size:12pt", href = "https://github.com/holtzy/Unics" , target="_blank"), style="color:white ; font-family: 'times'; font-size:12pt ; font-type:normal")
			)
       		
		),
	fluidRow( style=" opacity: 0.8 ; background-color: black ; margin-top: 0px ; width: 100%; ", br(), br())

	# -------------------------------------------------------------------------------------







# Close the ui
))
