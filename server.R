
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
  # graph 1A (Pi)
  # ===========================
  output$my_plot1A=renderPlot({ 
	
	# récupération des paramètres
	CV=as.numeric(input$CV_g1)/100
	N1=as.numeric(input$N_g1[1])
	N2=as.numeric(input$N_g1[2])
	Nind=as.numeric(input$Nind_g1)
	Alpha=as.numeric(input$Alpha_g1)
	LambdaInd=as.numeric(input$LambdaInd_g1)
	LambdaPool=as.numeric(input$LambdaPool_g1)
	
	# function to plot
    my_fun=function(x){
        valpool=(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2)/x
        valind=(1 +(Nind-1)*(1+LambdaInd*(1+Alpha))/LambdaInd^2)/Nind
        val=sqrt(valpool/valind)
        return(val)
    }

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun , size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
      	scale_y_continuous("SE pool / SE individual") + #,limits = c(0.5, 1.5)) +
      	scale_x_continuous("")
  })



  # ===========================
  # graph 1B (Pi)
  # ===========================
  output$my_plot1B=renderPlot({ 
	
	# récupération des paramètres
	Pi1=as.numeric(input$Pi_g1_1)
	Pi2=as.numeric(input$Pi_g1_2)
	Pi3=as.numeric(input$Pi_g1_3)
	N1=as.numeric(input$N_g1[1])
	N2=as.numeric(input$N_g1[2])
	Alpha=as.numeric(input$Alpha_g1)
	LambdaPool=as.numeric(input$LambdaPool_g1)
	CV=as.numeric(input$CV_g1) / 100
	
			
	# function to plot
	my_fun=function(x, Pi=Pi){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2))
		return(val)
	}

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(Pi=Pi1),  aes(colour = paste("Pi = ",Pi1,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Pi=Pi2),  aes(colour = paste("Pi = ",Pi2,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Pi=Pi3),  aes(colour = paste("Pi = ",Pi3,sep="")), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
		  scale_y_continuous("Standard error in haplotype frequency estimate",limits = c(0, 0.5)) +
		  scale_x_continuous("Sample size (N)")

  })
  
  
  
  
  
  
  
  
  
    


  # ===========================
  # graph 2A (CV)
  # ===========================
  output$my_plot2A=renderPlot({ 
	
	# récupération des paramètres
	CV1=as.numeric(input$CV_g2_1) /100
	CV2=as.numeric(input$CV_g2_2) /100
	CV3=as.numeric(input$CV_g2_3) /100
	N1=as.numeric(input$N_g2[1])
	N2=as.numeric(input$N_g2[2])
	Nind=as.numeric(input$Nind_g2)
	Alpha=as.numeric(input$Alpha_g2)
	LambdaInd=as.numeric(input$LambdaInd_g1)
	LambdaPool=as.numeric(input$LambdaPool_g1)
	Pi=as.numeric(input$Pi_g2)
	
	# function to plot
    my_fun=function(x, CV=CV){
        valpool=(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2)/x
        valind=(1 +(Nind-1)*(1+LambdaInd*(1+Alpha))/LambdaInd^2)/Nind
        val=sqrt(valpool/valind)
        return(val)
    }

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(CV=CV1),  aes(colour = paste("CV = ",CV1,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(CV=CV2),  aes(colour = paste("CV = ",CV2,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(CV=CV3),  aes(colour = paste("CV = ",CV3,sep="")), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
      scale_y_continuous("") + #,limits = c(0.5, 1.5)) +
      scale_x_continuous("")
  })



  # ===========================
  # graph 2B (CV)
  # ===========================
  output$my_plot2B=renderPlot({ 
	
	# récupération des paramètres
	CV1=as.numeric(input$CV_g2_1) /100
	CV2=as.numeric(input$CV_g2_2) /100
	CV3=as.numeric(input$CV_g2_3) /100
	N1=as.numeric(input$N_g2[1])
	N2=as.numeric(input$N_g2[2])
	Nind=as.numeric(input$Nind_g2)
	Alpha=as.numeric(input$Alpha_g2)
	LambdaInd=as.numeric(input$LambdaInd_g1)
	LambdaPool=as.numeric(input$LambdaPool_g1)
	Pi=as.numeric(input$Pi_g2)
	
	# function to plot
	my_fun=function(x, CV=CV){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2))
		return(val)
	}

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(CV=CV1),  aes(colour = paste("CV = ",CV1,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(CV=CV2),  aes(colour = paste("CV = ",CV2,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(CV=CV3),  aes(colour = paste("CV = ",CV3,sep="")), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")
  })














  # ===========================
  # graph 3A (ALPHA)
  # ===========================
  output$my_plot3A=renderPlot({ 
	
	# récupération des paramètres
	Alpha1=as.numeric(input$Alpha_g3_1)
	Alpha2=as.numeric(input$Alpha_g3_2) 
	Alpha3=as.numeric(input$Alpha_g3_3) 
	N1=as.numeric(input$N_g3[1])
	N2=as.numeric(input$N_g3[2])
	Nind=as.numeric(input$Nind_g3)
	CV=as.numeric(input$CV_g3) / 100
	LambdaInd=as.numeric(input$LambdaInd_g3)
	LambdaPool=as.numeric(input$LambdaPool_g3)
	Pi=as.numeric(input$Pi_g3)
	
	# function to plot
    my_fun=function(x, Alpha=Alpha){
        valpool=(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2)/x
        valind=(1 +(Nind-1)*(1+LambdaInd*(1+Alpha))/LambdaInd^2)/Nind
        val=sqrt(valpool/valind)
        return(val)
    }

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(Alpha=Alpha1),  aes(colour = paste("Alpha = ",Alpha1,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Alpha=Alpha2),  aes(colour = paste("Alpha = ",Alpha2,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Alpha=Alpha3),  aes(colour = paste("Alpha = ",Alpha3,sep="")), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
      scale_y_continuous("") + #,limits = c(0.5, 1.5)) +
      scale_x_continuous("")
  })



  # ===========================
  # graph 3B (ALPHA)
  # ===========================
  output$my_plot3B=renderPlot({ 
	
	# récupération des paramètres
	Alpha1=as.numeric(input$Alpha_g3_1)
	Alpha2=as.numeric(input$Alpha_g3_2) 
	Alpha3=as.numeric(input$Alpha_g3_3) 
	N1=as.numeric(input$N_g3[1])
	N2=as.numeric(input$N_g3[2])
	Nind=as.numeric(input$Nind_g3)
	CV=as.numeric(input$CV_g3) / 100
	LambdaInd=as.numeric(input$LambdaInd_g3)
	LambdaPool=as.numeric(input$LambdaPool_g3)
	Pi=as.numeric(input$Pi_g3)
	
	# function to plot
	my_fun=function(x, Alpha=Alpha){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2))
		return(val)
	}

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(Alpha=Alpha1),  aes(colour = paste("Alpha = ",Alpha1,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Alpha=Alpha2),  aes(colour = paste("Alpha = ",Alpha2,sep="")), size = 1.5) +
		stat_function(fun=my_fun, args=list(Alpha=Alpha3),  aes(colour = paste("Alpha = ",Alpha3,sep="")), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  scale_y_continuous("",limits = c(0, 0.5)) +
	  scale_x_continuous("Sample size (N)")
  })









  # ===========================
  # graph 4A (LAMBDA)
  # ===========================
  output$my_plot4A=renderPlot({ 
	
	# récupération des paramètres
	LambdaPool1=as.numeric(input$LambdaPool_g4_1)
	LambdaPool2=as.numeric(input$LambdaPool_g4_2) 
	LambdaPool3=as.numeric(input$LambdaPool_g4_3) 
	N1=as.numeric(input$N_g4[1])
	N2=as.numeric(input$N_g4[2])
	Nind=as.numeric(input$Nind_g4)
	CV=as.numeric(input$CV_g4) / 100
	LambdaInd=as.numeric(input$LambdaInd_g4)
	Alpha=as.numeric(input$Alpha_g4)
	Pi=as.numeric(input$Pi_g4)
	
	# function to plot
    my_fun=function(x, LambdaPool=LambdaPool){
        valpool=(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2)/x
        valind=(1 +(Nind-1)*(1+LambdaInd*(1+Alpha))/LambdaInd^2)/Nind
        val=sqrt(valpool/valind)
        return(val)
    }

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool1), aes(colour = "Lambda = 5"), size = 1.5) +
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool2), aes(colour = "Lambda = 10"), size = 1.5) +
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool3), aes(colour = "Lambda3 = 100"), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
      scale_y_continuous("") + #,limits = c(0.5, 1.5)) +
      scale_x_continuous("")
  })



  # ===========================
  # graph 4B (LAMBDA)
  # ===========================
  output$my_plot4B=renderPlot({ 
	
	# récupération des paramètres
	LambdaPool1=as.numeric(input$LambdaPool_g4_1)
	LambdaPool2=as.numeric(input$LambdaPool_g4_2) 
	LambdaPool3=as.numeric(input$LambdaPool_g4_3) 
	N1=as.numeric(input$N_g4[1])
	N2=as.numeric(input$N_g4[2])
	Nind=as.numeric(input$Nind_g4)
	CV=as.numeric(input$CV_g4) / 100
	LambdaInd=as.numeric(input$LambdaInd_g4)
	Alpha=as.numeric(input$Alpha_g4)
	Pi=as.numeric(input$Pi_g4)
	
	# function to plot
	my_fun=function(x,  LambdaPool=LambdaPool){
		val=sqrt((Pi*(1-Pi)/x)*(1 + CV^2 * ((x-1)/x)*(1-(1+LambdaPool*(1+Alpha))/LambdaPool^2)+(x-1)*(1+LambdaPool*(1+Alpha))/LambdaPool^2))
		return(val)
	}

	# plot
	ggplot(data.frame(x=c(N1, N2)), aes(x)) +  
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool1), aes(colour = "Lambda = 5"), size = 1.5) +
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool2), aes(colour = "Lambda = 10"), size = 1.5) +
		stat_function(fun=my_fun, args=list(LambdaPool=LambdaPool3), aes(colour = "Lambda3 = 100"), size = 1.5) +
		theme( legend.position = c(.83, .9), legend.title=element_blank(), axis.text.x =element_text(color = "black", size = cextextaxis),axis.text.y =element_text(color = "black", size = cextextaxis),axis.title.x = element_text(face="bold", colour="black", size=cextitleaxis),axis.title.y = element_text(face="bold", colour="black", size=cextitleaxis) )+
	  	scale_y_continuous("",limits = c(0, 0.5)) +
	  	scale_x_continuous("Sample size (N)") 
  })





  
# Close the ShinyServer  
})
  	  	












