function [C, A] = orden(Ma)
%Esta función devuelve la posición de los picos (C) y su intensidad (A)
%en orden ascendente.

A=sort(Ma, 'descend');     %Valor de los picos en orden descendiente 
A(A==0)=[];

C = zeros(1,length(A));
for i=1:length(A)
    C(i)=find(Ma==A(i));    
end

A = [A 0];
C = [C 0];
end
