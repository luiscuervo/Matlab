function Ma = juntarR(A,B)
% junta los espectros de dos sonidos teniendo en cuenta que los alores son
% logaritmicos y el masking entre ellos.

Pa = 10.^(0.05*A);

Pb = 10.^(0.05*B);


M = Pb + Pa;
M(M==2) = 1;

M = 20*log10(M);


[rows, columns] = size(M);

Ma= zeros(rows,columns);
for i= 1:rows
    Ma(i,:) = fullmask(M(i,:));     %masking
end



end