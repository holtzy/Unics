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
			helpText( "How to optimize the precision of allele and haplotype frequency estimates using pooled-sequencing data" , style="color:Orange ; font-family: 'times'; font-size:30pt ; font-type:bold") ,
			br()
			)
		),
	fluidRow(align="right",
		style="opacity:0.9; background-color: white ;margin-top: 0px; width: 100%;",
		column(6,offset=3,
			helpText( "Nicolas O. Rode, Yan Holtz, Karine Loridon, Sylvain Santoni, Joëlle Ronfort & Laurène Gay" , style="color:grey ; font-family: 'times'; font-size:14pt ; font-type:italic" ),
			hr()
			)
		),
 	# -------------------------------------------------------------------------------------






 	# -------------------------------------------------------------------------------------
	# === 2/ Explanations
	fluidRow(align="center",
		style="opacity:0.9; background-color: white ;margin-top: 0px; width: 100%;",
		column(3,offset=3, align="justify",
			br(),
			"Sequencing pools of individuals allows estimating allele frequencies in many populations at a cheaper cost. Theoretical and emPirical studies show that pool- sequencing a limited number of individuals (tyPically fewer than 50) can provide reliable allele frequency estimates, provided that the different experimental factors potentially affecting estimate precision are carefully controlled for. Apart from individual sampling, the precision of frequency estimates",
			br()
			),
		column(3,offset=0, align="justify",
			br(),
			"is affected by DNA pooling and DNA sequencing. Unequal individual DNA contributions to the DNA pool affect the former, whereas the mean and variance in sequencing depth affect the latter. To our knowledge, no study explicitly distinguishes between these two factors; so that there is currently no method to experimentally estimate the importance of unequal individual DNA contributions without the confoundings of sequencing depth. We develop a ",
			br()
	)), br(),br(),
 	# -------------------------------------------------------------------------------------





	# -------------------------------------------------------------------------------------
	# === 3/ Widgets et graphiques
	fluidRow(align="center",

		# ------- Colonne 1
		column(3,
			helpText(HTML(text=paste("Unequal individual DNA contribution", "(CV)", sep="<br/>")) , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			fluidRow(align="center",
				column(offset=3,2,textInput("CV_g1_1", label="CV (val1)", value=0.2)),
				column(2,textInput("CV_g1_2", label="CV (val2)", value=0.2)),
				column(2,textInput("CV_g1_3", label="CV (val1)", value=0.5))        		
				),
			column(offset=3,6,hr()),
			fluidRow(align="center",
				column(5,offset=1, sliderInput("N_g1", label="N", min=1, max=1000, step=1, value=c(1,200) )),
				column(5,textInput("Pi_g1", label=HTML("&pi;"), value=0.25))
				),
			fluidRow(align="center",
				column(5,offset=1,textInput("Lambda_g1", label=HTML("&lambda;"), value=10)),
				column(5,textInput("Alpha_g1", label=HTML("&alpha;"), value=0.2))
				),
		plotOutput("my_plot1", height = "600px"),
		br()
		),

		# ------- Colonne 2
		column(3,
			helpText( HTML(text=paste("Allele frequency","  ", "(&pi;)", sep="<br/>")) , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			fluidRow(align="center",
				column(offset=3,2,textInput("Pi_g2_1", label=HTML("&pi; (val1)"), value=0.1)),
				column(2,textInput("Pi_g2_2", label=HTML("&pi; (val2)"), value=0.25)),
				column(2,textInput("Pi_g2_3", label=HTML("&pi; (val3)"), value=0.1))        		
				),
			column(offset=3,6,hr()),
			fluidRow(align="center",
				column(5,offset=1, sliderInput("N_g2", label="N", min=1, max=1000, step=1, value=c(1,200) )),
				column(5,textInput("CV_g2", label="CV", value=0.2))
				),
			fluidRow(align="center",
				column(5,offset=1,textInput("Lambda_g2", label=HTML("&lambda;"), value=10)),
				column(5,textInput("Alpha_g2", label=HTML("&alpha;"), value=0.2))
				),
		plotOutput("my_plot2", height = "600px"),
		br()
		),



		# ------- Colonne 3
		column(3,
			helpText( HTML(paste("Dispersion in sequencing depth", "(&alpha;)", sep="<br/>")) , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			fluidRow(align="center",
				column(offset=3,2,textInput("Alpha_g3_1", label=HTML("&alpha; (val1)"), value=0.01)),
				column(2,textInput("Alpha_g3_2", label=HTML("&alpha; (val2)"), value=0.2)),
				column(2,textInput("Alpha_g3_3", label=HTML("&alpha; (val3)"), value=1))        		
				),
			column(offset=3,6,hr()),
			fluidRow(align="center",
				column(5,offset=1, sliderInput("N_g3", label="N", min=1, max=1000, step=1, value=c(1,200) )),
				column(5,textInput("CV_g3", label="CV", value=0.2))
				),
			fluidRow(align="center",
				column(5,offset=1,textInput("Lambda_g3", label=HTML("&lambda;"), value=10)),
				column(5,textInput("Pi_g3", label=HTML("&pi;"), value=0.25))
				),
		plotOutput("my_plot3", height = "600px"),
		br()
		),
		
		# ------- Colonne 4
		column(3,
			helpText( HTML(paste("Average sequencing","depth", "(&lambda;)", sep="<br/>")) , style="color:Orange ; font-family: 'times'; font-size:20pt ; font-type:bold") ,
			fluidRow(align="center",
				column(offset=3,2,textInput("Lambda_g4_1", label=HTML("&lambda; (val1)"), value=5)),
				column(2,textInput("Lambda_g4_2", label=HTML("&lambda; (val2)"), value=10)),
				column(2,textInput("Lambda_g4_3", label=HTML("&lambda; (val3)"), value=100))        		
				),
			column(offset=3,6,hr()),
			fluidRow(align="center",
				column(5,offset=1, sliderInput("N_g4", label="N", min=1, max=1000, step=1, value=c(1,200) )),
				column(5,textInput("CV_g4", label="CV", value=0.2))
				),
			fluidRow(align="center",
				column(5,offset=1,textInput("Pi_g4", label=HTML("&pi;"), value=0.25)),
				column(5,textInput("Alpha_g4", label=HTML("&alpha;"), value=0.2))
				),
		plotOutput("my_plot4", height = "600px"),
		br()
		)
		
	),
	# -------------------------------------------------------------------------------------





	# -------------------------------------------------------------------------------------
	# === Last bandeau for the logos
	fluidRow(
		
		# Set the style of this page
		style=" opacity: 0.8 ; background-color: black ; margin-top: 0px ; width: 100%; ",
	
		# put the logos
		br(),
		column(2, offset=2, img(src="logo_INRA.png" ,  height = 70*grand, width = 120*grand) , br(),br() ),
		column(2, offset=1, img(src="logo_SUPAGRO.jpg" ,  height = 70*grand, width = 120*grand) ),
		column(2, offset=1, img(src="logo_ANR.png" ,  height = 70*grand, width = 110*grand) )
		
		)
	# -------------------------------------------------------------------------------------







# Close the ui
))
