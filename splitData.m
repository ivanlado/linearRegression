%This function splits data into x and y
%x is the independent variable
%y is the dependent variable
function [x, y] = splitData(data)
    n = size(data, 2);
    x = data(:, 1:n-1);
    y = data(:,n);
end