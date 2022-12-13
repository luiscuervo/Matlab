function [A,B] = Mleveling(A,B)
%Iguala las intensidades máximas de dos espectros (en un beat) subiendo
%todas las intensidades del espectro más débil un factor igual a la
%diferencia entre la intensidad máxima de A y la de B.

maxA = max(A);
maxB = max(B); 

if maxA < maxB
    
    d = maxB - maxA -0.0001; %el 0,0001 es para no volver loca a la función find
    for i = 1:108
        B(i) = B(i) - d;  
        
    end
    
    B(B==-d) = 0;
    
end


if maxA > maxB
    
    d= maxA - maxB-0.0001;
    for i = 1:108
        A(i) = A(i) - d;
        
    end
    
    A(A==-d) = 0;
    
end

end