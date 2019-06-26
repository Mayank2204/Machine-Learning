# Support Vector regression

#Importing dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting the dataset to SVR
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')

#Prediciting a new resultset
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing the SVR results
library(ggplot2)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red')+
  geom_line(aes(x = dataset$Level, y = predict(regressor, newdata = dataset)),
            colour = 'blue')+
  ggtitle('Truth vs Bluff (SVR)')+
  xlab('Level')+
  ylab('Salary')

