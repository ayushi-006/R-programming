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


















