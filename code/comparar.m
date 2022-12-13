function Z = comparar(A,B)
%efectua el producto escalar (normalizado por el modulo de A) de las filas
%de dos matrices.

[rows, ~] = size(A);

for i = 1:rows              %Igualamos las intensidades de los espectros
[A(i,:), B(i,:)] = leveling(A(i,:), B(i,:));
end

Z = zeros(1,rows);
for i = 1:rows
    a = A(i,:);
    b = B(i,:);
    
    if (sum(a)~=0) && (sum(b)~=0)
        Z(i) = dot(a,b)/(norm(a));%*norm(b));
    end

    
end
Z(isnan(Z))=0;
%Z(Z==12345)=[]; %---- 

end

