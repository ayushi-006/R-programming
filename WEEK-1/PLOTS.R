#plots and charts using bar plot
#DATA VISUALIZATION
Weekly_Gasoline_prices <- read_excel("Weekly Gasoline prices.xls")
View(Weekly_Gasoline_prices)

head(Weekly_Gasoline_prices) 

plot(Weekly_Gasoline_prices , type = "l" , main = "TIME_SERIES" , col="red" , lwd=2)
#lwd -> line width


library(zoo)

WGP = zoo(Weekly_Gasoline_prices$`Gasoline Prices  (Dollars per Gallon)` , Weekly_Gasoline_prices$Date)

WGP1 = aggregate(WGP, as.yearqtr)

par(mfrow=c(2,1))

plot(WGP1 , type ="l" , main="Weekly Gasoline Qtrly" , col="blue" , lwd=2)

plot(WGP, type = "l" , main = "Weekly Gasoline Weekly" , col="green" , lwd=2)




#BARPLOTS
par(mfrow= c(1,1))

barplot(WGP1, ylab="Qtrly Prices" , xlab="Date" , col="brown" , main="Gasoline" , border ="black")

######################################

Nations <- read_excel("Nations.xlsx")
View(Nations)


head(Nations)
Nations$Outlook=as.factor(Nations$Outlook) #changing the datatype to factor which is useful to plot graphs as it is a categorical variable
 levels(Nations$Outlook)
barplot(table(Nations$Outlook) , main = "Barplot" ,col = rainbow(3),          # Apply a gradient of colors
        xlab = "Outlook",                            # Label for x-axis
        ylab = "Number of Nations",                  # Label for y-axis
        border = "black",                            # White borders for the bars
        cex.main = 1.5,                              # Increase the title size
        cex.lab = 1.2,                               # Increase the axis label size
        cex.axis = 1.1)  

legend("topleft" , c("neg","pos" , "stable"), fill=rainbow(3),cex=0.9 ) 


#Visualizing Frequency and Non Frequency Distribution

library(readxl)
Soft_Drink <- read_excel("Cold drink data.xlsx")

head(Soft_Drink)
table(Soft_Drink) #gives the count of each soft drink
Soft_Drink=cbind.data.frame(table(Soft_Drink))
Soft_Drink
head(Soft_Drink)


Soft_Drink$Relative_Freq = Soft_Drink$Freq/sum(Soft_Drink$Freq)
barplot(Soft_Drink$Relative_Freq ,  names.arg = Soft_Drink$Soft_Drink , col=c(1,2,3,4,5))

#PIE-PLOT

paste0(round(100*Soft_Drink$Relative_Freq , 2) , "%")

pie(Soft_Drink$Relative_Freq , labels=paste0(round(100*Soft_Drink$Relative_Freq , 2) , "%") , main="SOFT_DRINK" , col=rainbow(5) )

legend("topleft", c("ck","Dck","pep","psi" , "spr") , cex=0.8 , fill=rainbow(5))



library(plotrix)
pie3D(Soft_Drink$Relative_Freq , labels=paste0(round(100*Soft_Drink$Relative_Freq , 2) , "%") , main="SOFT_DRINK" , col=rainbow(5) )
legend("topleft", c("ck","Dck","pep","psi" , "spr") , cex=1, fill=rainbow(5))


##HISTOGRAM

var= sample(50:100 , 10000, replace =T)
summary(var)
par(mfrow=c(1,3))
  hist(var, main= "var_100" , xlab = "Frequency " , ylab = "variable ", col=rainbow(20) , border="green" , 
       breaks=100)
  hist(var,main= "var_10",xlab = "Frequency " , ylab = "variable ", col=rainbow(20) , border="green" , 
       breaks=10)
  hist(var, main= "var_1",xlab = "Frequency " , ylab = "variable ", col=rainbow(20) , border="green" , 
       breaks=1)
  
  
par(mfrow=c(1,1))
  hist(var,main= "var_10",xlab = "Frequency " , ylab = "variable ", col=rainbow(20) , border="green" , 
     breaks=10)
  #adding text labels to the graph
  m= hist(var , xlab="Frequency" , ylab = "variable ", col=rainbow(20) , border="green" ,  breaks=10)
  text(m$mids , m$counts , lables =m$counts , adj =c(0.5,-0.5))
  







