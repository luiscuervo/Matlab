function M = Threshold(X)
%Restamos a nuestro espectro el quiet threshold

[rows, columns] = size(X);

load('QuietThreshold'); 

for i = 1:rows
    
    for j = 1:columns
        M(i,j) = X(i,j) - QuietThreshold(j); 
    end
    
end
 M(M<0) = 0;
    
 
end
