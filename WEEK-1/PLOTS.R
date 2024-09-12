#plots and charts using bar plot
#DATA VISUALIZATION
Weekly_Gasoline_prices <- read_excel("Weekly Gasoline prices.xls")
View(Weekly_Gasoline_prices)

head(Weekly_Gasoline_prices) 

plot(Weekly_Gasoline_prices , type = "l" , main = "TIME_SERIES" , col="red" , lwd=2)


