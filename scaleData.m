%This function scales data using standardization
%x parameter is the data to be scaled
%data parameter is the data in relation to which x is scaled
function scaledData = scaleData (x, data)
    %Standard desviation is calculated
    sd = std(data);
    %If any value of sd is 0, it is replaced by 1, as diving by 0 op is not
    %allowed
    sd(abs(sd)<eps) = 1;
    %Data is scalled
    scaledData = (x - mean(data))./sd;
end