%Double precision
format long;
global eps;
eps = 1e-8;

%Data from file is loaded
data = load('data.csv');

%Data is prepared by adding the bias unit and scaling it (standardization)
data = treatData(data);
scalledData = scaleData(data, data);
n = size(data, 2);

%Vector for beta paremeters is created and initialized to zero
betas = iniBetas(data);

%Data to predict: The bias unit is added, and data scaled
predict = [1650 3];
predict = treatData(predict);
predict = scaleData(predict, data(:,1:n-1));

%Algorithm is trained: optimal betas are obtained
betas = gradientDescent(scalledData, betas, 0.01, 400);

%Prediction is made for scaled values. So then it must be unscaled
prediction = hypFunction(predict, betas);
prediction = unscaleData(prediction, data(:,n));
prediction

%Plot data
plotData(data, betas);