#importing the datasets

datasets = read.csv("Data.csv")


#taking care of missing data
datasets$Age = ifelse(is.na(datasets$Age),
                      ave(datasets$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                      datasets$Age)
datasets$Salary = ifelse(is.na(datasets$Salary),
                         ave(datasets$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                         datasets$Salary)
#Encoding categorical data
datasets$Country = factor(datasets$Country,
                         levels = c('France','Spain', 'Germany'),
                         labels = c(1,2,3))
datasets$Purchased = factor(datasets$Purchased,
                          levels = c('No','Yes'),
                          labels = c(0,1))

#spliting the dataset into training set and test set
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(datasets$Purchased, SplitRatio = 0.8)
training_set=subset(datasets, split == TRUE)
test_set=subset(datasets, split == FALSE)

#feature scaling
training_set[, 2:3] = scale(training_set[, 2:3])
test_set[, 2:3] = scale(test_set[, 2:3])
