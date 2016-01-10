function [Wh, Bh, Wo, Bo] = backpropagation(Ah, Ao, Wh, Wo, Bh, Bo, Y, X, alpha)
    
    %%Cálculo de los deltas
    %delta de la capa de salida
    do = Ao .* (1-Ao) .* (Y'-Ao);
    %delta de la capa de entrada
	for i = 1:length(Wo)
		dh(i,1) = Ah(i) * (1-Ah(i)) * (do'* Wo(:,i));
    end
    
    %%Actualización de los pesos y los bias
    Wh = Wh + alpha*(X*dh')';
    Bh = Bh + alpha.*dh;
    Wo = Wo + alpha*(Ah*do')';
    Bo = Bo + alpha.*do;
    
end