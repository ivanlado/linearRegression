%This function gets the optimum betas making use of gradient descent
%algorithm
function [betas] = gradientDescent(datos, betas, alpha, nMaxIter)
    m = size(datos, 1);
    %Data is split
    [x, y] = splitData(datos);
    %Gradient descent
    for i = 1:nMaxIter
        diferencia = hypFunction(x, betas) - y;
        gradientVector = (diferencia.')*x;
        betas = betas - (alpha/m)*(gradientVector.');
    end
end