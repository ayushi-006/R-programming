#starting from the very beginning 
#to get the current working directory
getwd()

#log calculations
log(200, 4)
?log
log10(100)

#using c() function
c(1,2,3,4)
head(V)
head(V)
c(1,2,3,4)
V=c(1,2,3,4) #creting vectors
V
5:13  #prints from 5 to 13 (inclusive)
head(V)
tail(V)
v1
v1 = 5:13 #assiging numbers to v1
v1
seq(5,9, by = 0.2) #prints from 5 to 9 with the difference of 0..2
seq(5,9, length = 10) #prints from 5 to 9 containing 10 points with equal distance

#addition
a1=c(2,4,6)
a2=c(3,5,7)
a1+a2

a1=c(2,4,6,3,6,8,0,)
a1=c(2,4,6,3,6,8,0,5)
a2=c(3,5,7)
a1+a2


#sorting
v=c(3,4,5,2,5,7,4,21,-1)
sort(v) 
sort(v, decreasing=T) #setting decreasing order as TRUE  
sort(color)
color=c("red","blue","green","purple")
sort(color)
v[3] 


#indexing

s=c(54,56,99,12,44)
s[3]
s[c(1,4,6)] #prints down the values at 1st,4th and 6th index
s[c(1,4,1)]
s[-c(1,4)] #prints everything except 1st and 4th index
s[3]

#FUNCTIONS
X=c(2,3,4,5,6,7,8,9)
mean(X)
func=function(Y){sum(X)/length(X)}
func(X)


#defining standard deviation

X=c(2,3,4,5,6,7,8,9)
SD= function(X){sqrt(((sum(X)/length(X))^2)/(length(X)-1))}
SD(X)

#IFELSE
gender= c('M','F','F','F','M', 'M','F','F','F','M', 'M','F','F','F','M','M','F','F','F','M')
ifelse(gender=='M', print('ok'),print('no'))
length(gender)

#FOR 
for (i in 1: length(gender)){
  ifelse(gender[i] =='M' , print('OK'), print('no'))}

