%This function treats data: in case there is not the bias unit, it is added
function datosTratados = treatData(datos)
    %No. of training examples is calculated
    m = size(datos, 1); %
    %In case there is not bias unit, it is added
    if any(datos(:,1)-ones(m, 1))== true
        datos = [ones(m, 1) datos];
    end
    datosTratados = datos;
end
