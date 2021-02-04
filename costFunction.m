function cost = costFunction(datos, betas)
    m = size(datos, 1);
    [x, y] = splitData(datos);
    cost = hypFunction(x, betas);
    cost = (cost.')*cost;
    cost = cost/m;
end
