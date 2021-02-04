function plotData(data, betas)

    %Number of features is calculated
    n = size(data, 2)-1;
    
    %Data is split
    [x, y] = splitData(data);
    
    %To points are taken with the purpose of plotting regression line
    a = min(x);
    b = max(x);
    %These point are scaled
    sa = scaleData(a, data(:,1:n));
    sb = scaleData(b, data(:,1:n));
    %Image for these scaled points is calculated
    ya = hypFunction(sa, betas);
    yb = hypFunction(sb, betas);
    %Image of these point is unscaled
    ya = unscaleData(ya, data(:,n+1));
    yb = unscaleData(yb, data(:,n+1));
    
    %One plot is display for every feature
    for i=2:n
        subplot(1, n-1, i-1);
        plot(data(:,i), data(:,n+1), '*', [a(i) b(i)], [ya yb], '-');
    end
end