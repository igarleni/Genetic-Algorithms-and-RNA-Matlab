function [a] = Burbuja()
a=magic(4); 
a= a(1,:);
n=length(a); 

% ORDENAMIENTO CRECIENTE DE BURBUJA 
for i=1:n 
for j=1:n-i 
if a(j)>a(j+1) 
aux=a(j); 
a(j)=a(j+1); 
a(j+1)=aux; 
end 
end 
end 
display(a) 