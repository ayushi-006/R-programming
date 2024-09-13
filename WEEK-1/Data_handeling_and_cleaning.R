#Data handling and data cleaning 
data = read.csv("Salary.csv") #read the file
dim(data)  #get the dimension
summary(data) #summary of the data
brief(data,5)
str(data)
colnames(data)

#change the col names

colnames(data)[1] = "NAME"
colnames(data)[2:5]= c("JOB","AGENCYid","AGENCYNAME","HIREINGdate")

colnames(data)

#CLEANING THE Data Frame
#finding the NA value

X = c(2,4,NA,0.3,-8,2.2,10,0)
X
X[3]
X>2 #checking the condition

#use of "&" and "!"
 
X>2 & !is.na(X)  #finding greater than 2 and also not NA

(X==0 | X==2) & !is.na(X)

#SIMILAR OPERATIONS
is.nan(0/0)
is.nan(4/2)

is.infinite(1/0)

#MAKING A COPY OF ORG DATA
data1=data
#checking NA values in it
sum(is.na(data))
data1[1000,3]=NA
data1[1010,4]=NA
data1[480,2]=NA
data1[940,3]=NA

sum(is.na(data1)) 
#or
all(!is.na(data1))


#setting NA values to 0
data1[is.na(data1)]=0
sum(is.na(data1)) 

#creating a Data Frame
DF = data.frame(a=c(NA,1,3),b=c("one",NA,"two"))
DF
subset(DF,!is.na(a)) #will remove the row which has NA in "a"
subset(DF,!is.na(b))#will remove the row which has NA in "b"

#to remove all NA in the DATA FRAME
subset(DF, complete.cases(DF))
na.omit(DF)

######

library(car)
head(Freedman) #freedman is a database
summary(Freedman)
dim(Freedman)
str(Freedman)

#calc the median
median(Freedman$density) #because it has NA observation
median(Freedman$density , na.rm=T) #removes NA values


mean(Freedman$density) #because it has NA observation
mean(Freedman$density , na.rm=T) #removes NA values
#another way
Freedman.good=na.omit(Freedman) #removes full row with NA value
summary(Freedman.good)

Freedman_notav = Freedman[!complete.cases(Freedman),] #display all the rows with NA values
Freedman_notav

########## replacing outliers with NA############

library(UsingR)
x=babies$dwt  #dwt is a row

summary(x) 
#handling the outliers
x[x==999]=NA #assigning NA to all 999 values 

range(x)
summary(x)

range(x , na.rm=T)

############Removing non-unique values########
head(data)
data2 = data

data3=rbind.data.frame(data2,data2[1:500,]) #COMBINED THE FIRST 500 ROWS OF DATA2 AT THE END
dim(data3)

data4 = unique(data3) #removing the duplicates i.e. 500 rows
dim(data4)  

###################DATA HANDLING
##selection of rows and columns 


head(iris)
iris[3]
iris[,c(3,5)]
iris[c(1:4) , c(2:5)]



#########creation of new var
iris$Petal.Ratio = iris$Petal.Length/iris$Petal.Width
iris$Sepal.Ratio = iris$Sepal.Length/iris$Sepal.Width
head(iris)


######extracting observations

iris[iris$Petal.Width>0.5 & iris$Species=='setosa'| iris$Species== "virginica",]

########summarizing the content
summarize(iris,
          Petal.Length.mean = mean(Petal.Length),
          Sepal.Length.mean = mean(Sepal.Length),
          Petal.Length.sd = sd(Petal.Length),
          Sepal.Length.sd = sd(Sepal.Length)
)


######### CREATE FULL DATA FRAME and ASSIGN ITS VALUES

library(car)
dim(Davis)
head(Davis,5)

output = data.frame(matrix(nrow=dim(Davis)[1] , ncol=dim(Davis)[2]))
dim(output)
head(output,5)
colnames(output)

colnames(output) = c("gender","wt","ht","repwt","repht")
head(output,5)

output$gender = Davis$sex
output$wt = Davis$weight
output$ht = Davis$height
output$repwt = Davis$repwt
output$repht = Davis$repht

head(output)
head(Davis)

############WORKING WITH FACTOR VARIABLES

library(UsingR)
head(Cars93)
dim(Cars93)

d= Cars93[c(1:3),c(1:4)]
d
str(d)
summary(d)
#assigning NA values

d[1,2]=NA
d[3,3]=NA
d

d[3,c(2,4)]=list("A3",40)
d
class(d$Model) #gives the level 

#dropping the level
d$Model= droplevels(d$Model)
levels(d$Model)

#specifying the new levels
levels(d$Model) = c(levels(d$Model), c("A3", "A4", "A6"))
levels(d$Model)

d[3,c(2,4)]=list("A3",40)
d

levels(d$Type)
d$Type=droplevels(d$Type)


levels(d$Type) = c(levels(d$Type), c("LARGE" , "SMALL", "CONVERTIBLE", "SLEAK"))

d[3, c(3)]=list("CONVERTIBLE" )
d

### ADDING A NEW ROW

d[4,] = list("Audi", "A6" , "LARGE" , "43.2")
d
#another way by using rbind
d=rbind(d, list("Audi", "A4" , "SLEAK" , "41.2"))
d

### CREATING A NEW COLUMN

d$Min.Price = as.numeric(d$Min.Price)
d[,5]=d$Min.Price*1.3  
#or
d = within(d, {MODPRICE= Min.Price*1.3})
d


colnames(d)[5] = "MODPRICE"
d

##########TRANSFORMING DATAFRAMES ACROSS LONG AND WIDE FORMATS


speed1 = c(23,45,65,35,55,78)
speed2 = c(23,45,65,35,55,78)
speed3 = c(23,45,65,35,55,78)
speed4 = c(23,45,65,35,55,78)
speed5 = c(23,45,65,35,55,78)
id = c(1,2,3,4,5,6)
max= c(90,80,89,78,120,130)

speed = cbind.data.frame(id,speed1,speed2,speed3,speed4,speed5,max)

head(speed)
summary(speed)



#####################PORTFOLIO ANALYTICS

#Load the required libraries



library(PortfolioAnalytics)
library(tidyverse)
library(patchwork)

Assets_Price_xts = readRDS("~/R-programming/datasets/Assets_Price_xts.rds")

class(Assets_Price_xts)
head(Assets_Price_xts)
summary(Assets_Price_xts)
 str(Assets_Price_xts)
dim(Assets_Price_xts)
glimpse(Assets_Price_xts)
 

Assets_Return_xts <- readRDS("~/R-programming/datasets/Assets_Return_xts.rds")

class(Assets_Return_xts)
head(Assets_Return_xts)
summary(Assets_Return_xts)
str(Assets_Return_xts)
dim(Assets_Return_xts)
glimpse(Assets_Return_xts)


######Visualize with S&P 500 movement
#Regression visualization

p1= ggplot(Assets_Price_xts, aes(x=SnP500, y=Bit))+ #the main plotting function , Aesthetics (aes) 
  geom_point(col="red")+geom_smooth(col="blue" , method="lm")+ # Geometries (geom)
  labs(title = "Bitcoin vs S&P500" , y="Bitcoin" , x="S&P500")

#geom_point() is a function in ggplot2 that adds a scatter plot layer

p2= ggplot(Assets_Price_xts, aes(x=SnP500, y=ESG_Fund))+ #initializing the plot
  geom_point(col="red")+geom_smooth(col="blue" , method="lm")+ #adding layers 
  labs(title = "ESG_Fund vs S&P500" , y="ESG_Fund" , x="S&P500")


p3= ggplot(Assets_Price_xts, aes(x=SnP500, y=EUA_Futures))+
  geom_point(col="red")+geom_smooth(col="blue" , method="lm")+
  labs(title = "EUA_Futures vs S&P500" , y="EUA_Futures" , x="S&P500")

p1+p2+p3



#######DATA VISUALIZATION
###Density plot examination

p1=ggplot(Assets_Price_xts , aes(x=Bit , color = factor(Year), fill=factor(Year)))+
 geom_density(linewidth=1 , alpha= 0.5)+
 labs(title="Bitcoin" , y="" , x="" ,col="Year" , fill="Year")

p2=ggplot(Assets_Price_xts , aes(x=EUA_Futures , color = factor(Year), fill=factor(Year)))+
  geom_density(linewidth=1 , alpha= 0.5)+
  labs(title="EUA_Futures" , y="" , x="" ,col="Year" , fill="Year")

p3=ggplot(Assets_Price_xts , aes(x=ESG_Fund , color = factor(Year), fill=factor(Year)))+
  geom_density(linewidth=1 , alpha= 0.5)+
  labs(title="ESG_Fund" , y="" , x="" ,col="Year" , fill="Year")


p4=ggplot(Assets_Price_xts , aes(x=SnP500, color = factor(Year), fill=factor(Year)))+
  geom_density(linewidth=1 , alpha= 0.5)+
  labs(title="SnP500" , y="" , x="" ,col="Year" , fill="Year")

p1+p2+p3+p4

#plotting the type of graph we want is done by, geom_<type of graph>

####BOX PLOTS
p1=ggplot(Assets_Price_xts, aes(y=EUA_Futures , fill=factor(Year)))+
 geom_boxplot()+labs(fill="Year" , title="EUA Futures" , y="")

p2=ggplot(Assets_Price_xts, aes(y=SnP500 , fill=factor(Year)))+
  geom_boxplot()+labs(fill="Year" , title="SnP 500" , y="")

p3=ggplot(Assets_Price_xts, aes(y=ESG_Fund , fill=factor(Year)))+
  geom_boxplot()+labs(fill="Year" , title="ESG Fund" , y="")

p4=ggplot(Assets_Price_xts, aes(y=Bit , fill=factor(Year)))+
  geom_boxplot()+labs(fill="Year" , title="Bitcoin" , y="")


p1+p2+p3+p4+plot_annotation(title="Box Plot Yearwise",
                            theme=theme(plot.title = element_text(hjust=0.5,
                                                                  size=20,face="bold")))



















