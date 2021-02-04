%This function return a betas vector initialized to zero
function betas = iniBetas(datos)
    %Data is treated (this function treats the data in case it has not been
    %treated before)
    datos = treatData(datos);
    %No. of features is calculated
    n = size(datos, 2) - 1;
    %Betas vector is initialized to zero
    betas = zeros(n, 1);
end