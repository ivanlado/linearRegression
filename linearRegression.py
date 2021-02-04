# # LINEAR REGRESSION

# ### Libraries are imported
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
from sklearn import preprocessing
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn import metrics

# ### Data is loaded
fileName = 'data.csv'

# ### Names for the columns
colNames = ["area", "no. rooms", "price"]
xNames = ["area", "no. rooms"]
yNames = ["price"]

# ### Data is loaded
data = pd.read_csv(fileName, names = colNames)

# ### Data is split
dataX = data[xNames]
dataY = data[yNames]

# ### A quick look to the data is taken
data.head()

# ### Whether data contains null values is checked
data.isnull().sum().sum() ==0

# ### Data is scaled using standardization
scaler = preprocessing.StandardScaler()
scaledData = data.copy()
scaler.fit(data)
scaledData[colNames] = scaler.transform(data)

# ### Scaler for variable X
scalerX = preprocessing.StandardScaler()
scalerX.fit(dataX)

# ### Scaler for variable Y
scalerY = preprocessing.StandardScaler()
scalerY.fit(dataY)

# ### Data is split
xScaled = scaledData[xNames]
yScaled = scaledData[yNames]
xtrain, xtest, ytrain, ytest = train_test_split(xScaled, yScaled, test_size=0.3, random_state=45)
ytestUnscaled = scalerY.inverse_transform(ytest)

# ### Model is trained
reg = LinearRegression()
prediction = reg.fit(xtrain, ytrain)

# ### Prediction for xtest is made
predictionScaled = prediction.predict(xtest)
predictionUnscaled = scalerY.inverse_transform(predictionScaled)

# ### Error is calculated
rmse = np.sqrt(metrics.mean_squared_error(predictionScaled, ytest))
rmseUnscaled = np.sqrt(metrics.mean_squared_error(predictionUnscaled, ytestUnscaled))

# ### Evaluate a particular example
example = [[1650, 3]]
exampleDt = pd.DataFrame(data=[[1650, 3]], columns=xNames, index=None)
scalerY.inverse_transform(prediction.predict(scalerX.transform(exampleDt)))

# ### Data is plotted
kk = sb.pairplot(data, x_vars=xNames, y_vars=yNames, diag_kind=None)