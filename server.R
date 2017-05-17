
	######################################################
	#
	#	THE FreqUNeq DNA pool APP
	#
	#####################################################





# open server
shinyServer(function(input, output) {


  
  ## Size of axis labels
  cextextaxis = 12
  ## Size of axis title
  cextitleaxis = 20	


  # ===========================
  # graph 1
  # ===========================
  output$my_plot1=renderPlot({ 
	
	# récupération des paramètres
	CV1=as.numeric(input$CV_g1_1)
	CV2=as.numeric(input$CV_g1_2)
	CV3=as.numeric(input$CV_g1_3)
	N1=as.numeric(input$N_g1[1])
	N2=as.numeric(input$N_g1[2])
	Alpha=as.numeric(input$Alpha_g1)
	Lambda=as.numeric(input$Lambda_g1)
	Pi=as.numeric(input$Pi_g1)
	
	# function to plot
	my_fun1=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV1^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun2=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV2^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun3=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV3^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}		

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun1, aes(colour = "CV1"), size = 1.5) +
		stat_function(fun=my_fun2, aes(colour = "CV2"), size = 1.5) +
		stat_function(fun=my_fun3, aes(colour = "CV3"), size = 1.5) +
		theme( legend.position = c(.9, .9),axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("Standard error in haplotype frequency estimate",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")
  })




  # ===========================
  # graph 2
  # ===========================
  output$my_plot2=renderPlot({ 
	
	# récupération des paramètres
	Pi1=as.numeric(input$Pi_g2_1)
	Pi2=as.numeric(input$Pi_g2_2)
	Pi3=as.numeric(input$Pi_g2_3)
	N1=as.numeric(input$N_g2[1])
	N2=as.numeric(input$N_g2[2])
	Alpha=as.numeric(input$Alpha_g2)
	Lambda=as.numeric(input$Lambda_g2)
	CV=as.numeric(input$CV_g2)
	
			
	# function to plot
	my_fun1=function(x){
		val=sqrt((Pi1*(1-Pi1)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun2=function(x){
		val=sqrt((Pi2*(1-Pi2)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun3=function(x){
		val=sqrt((Pi3*(1-Pi3)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha))/Lambda^2))
		return(val)
	}		
	#my.labs <- list(bquote(alpha==.(value)),bquote(beta==.(value)))
	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun1, aes(colour = "Pi1"), size = 1.5) +
		stat_function(fun=my_fun2, aes(colour = "Pi2"), size = 1.5) +
		stat_function(fun=my_fun3, aes(colour = "Pi3"), size = 1.5) +
	  theme( legend.position = c(.9, .9),axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("Standard error in haplotype frequency estimate",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")

  })
  
  
  
    

  # ===========================
  # graph 3
  # ===========================
  output$my_plot3=renderPlot({ 
	
	# récupération des paramètres
	Alpha1=as.numeric(input$Alpha_g3_1)
	Alpha2=as.numeric(input$Alpha_g3_2)
	Alpha3=as.numeric(input$Alpha_g3_3)
	N1=as.numeric(input$N_g3[1])
	N2=as.numeric(input$N_g3[2])
	Pi=as.numeric(input$Pi_g3)
	Lambda=as.numeric(input$Lambda_g3)
	CV=as.numeric(input$CV_g3)
	
			
	# function to plot
	my_fun1=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha1))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha1))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun2=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha2))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha2))/Lambda^2))
		return(val)
	}
	# function to plot
	my_fun3=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda*(1+Alpha3))/Lambda^2)+(x-1)*(1+Lambda*(1+Alpha3))/Lambda^2))
		return(val)
	}		

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun1, aes(colour = "Alpha1"), size = 1.5) +
		stat_function(fun=my_fun2, aes(colour = "Alpha2"), size = 1.5) +
		stat_function(fun=my_fun3, aes(colour = "Alpha3"), size = 1.5) +
	  theme( legend.position = c(.85, .9),axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("Standard error in haplotype frequency estimate",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")

  })
  
 
  # ===========================
  # graph 4
  # ===========================
  output$my_plot4=renderPlot({ 
	
	# récupération des paramètres
	Lambda1=as.numeric(input$Lambda_g4_1)
	Lambda2=as.numeric(input$Lambda_g4_2)
	Lambda3=as.numeric(input$Lambda_g4_3)
	N1=as.numeric(input$N_g4[1])
	N2=as.numeric(input$N_g4[2])
	Pi=as.numeric(input$Pi_g4)
	Alpha=as.numeric(input$Alpha_g4)
	CV=as.numeric(input$CV_g4)
	
			
	# function to plot
	my_fun1=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda1*(1+Alpha))/Lambda1^2)+(x-1)*(1+Lambda1*(1+Alpha))/Lambda1^2))
		return(val)
	}
	# function to plot
	my_fun2=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda2*(1+Alpha))/Lambda2^2)+(x-1)*(1+Lambda2*(1+Alpha))/Lambda2^2))
		return(val)
	}
	# function to plot
	my_fun3=function(x){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+Lambda3*(1+Alpha))/Lambda2^2)+(x-1)*(1+Lambda3*(1+Alpha))/Lambda3^2))
		return(val)
	}		

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun1, aes(colour = "Lambda1"), size = 1.5) +
		stat_function(fun=my_fun2, aes(colour = "Lambda2"), size = 1.5) +
		stat_function(fun=my_fun3, aes(colour = "Lambda3"), size = 1.5) +
	  theme( legend.position = c(.85, .9),axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("Standard error in haplotype frequency estimate",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")

  })
   
  
  
# Close the ShinyServer  
})
  	  	












