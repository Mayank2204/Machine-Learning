#Polynomial Regression

#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting linear regression to dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)

#Fitiing ploynomial regression to dataset
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)

#Visualizing the linear regression results
library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
           colour='red')+
  geom_line(aes(x=dataset$Level, y=predict(lin_reg, newdata = dataset)),
            colour='blue')+
  ggtitle('Truth vs Bluff (Linear regression)')+
  xlab('Level')+
  ylab('Salary')

#Visualizing the polynomial Regression results
# library(ggplot2)
ggplot()+
  geom_point(aes(x=dataset$Level, y=dataset$Salary),
             colour='red')+
  geom_line(aes(x=dataset$Level, y=predict(poly_reg, newdata = dataset)),
            colour='blue')+
  ggtitle('Truth vs Bluff (Polynomial regression)')+
  xlab('Level')+
  ylab('Salary')
  
