function [genes] = Extractor_Genes(ind)
    a = Binary_to_int (ind(1:5)) + 5;
    b = Binary_to_int (ind(6:10)) + 5;
    x0 = Binary_to_int (ind(11:16)) + 19;
    y0 = Binary_to_int (ind(17:22)) + 19;
    theta = Binary_to_int (ind(23:29));
    theta = theta*90/128; %Escalamos de 0 a 127 a 0 a 179
    theta = theta * pi/180;
    genes = [a,b,x0,y0,theta];
end