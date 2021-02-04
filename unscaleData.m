%This function unscales data using standardization
%x parameter is the data to be unscaled
%data parameter is the data in relation to which x is unscaled
function unscaledData = unscaleData(x, data)
    %Average and mean are calculated
    average = mean(data);
    sd = std(data);
    %Data is unscaled
    unscaledData = (x.*sd)+average;
end