#Random Forest Regression

#importing the Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt

#Importing the dataset
dataset = pd.read_csv('Position_Salaries.csv')
X = dataset.iloc[:, 1:2].values
y = dataset.iloc[:, 2].values

#Fitting Random Forest Regression to the dataset
from sklearn.ensemble import RandomForestRegressor
regressor = RandomForestRegressor(n_estimators = 300, random_state = 0)
regressor.fit(X, y)

#Predicting a new Result
y_pred = regressor.predict(6.5)

#Visualizing the Regression result
x_grid = np.arange(min(X), max(X), 0.01)
x_grid = x_grid.reshape((len(x_grid), 1))
plt.scatter(X, y, color = 'red')
plt.plot(x_grid, regressor.predict(x_grid), color = 'blue')
plt.title('Truth vs Bluff (Random Forest Reression)')
plt.xlabel('Position Level')
plt.ylabel('Salary')
plt.show()