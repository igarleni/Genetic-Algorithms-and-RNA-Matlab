function [entero] = binario_a_entero(binario)
    entero=0;
    L = length(binario);
    for i=1:L
        entero = entero + binario(i)*2^(i-1);
    end
end