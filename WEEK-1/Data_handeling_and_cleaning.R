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







