function count = CountMasking(A,B)
%La función recibe dos matrices con espectros, y devuelve el espectro
%conjunto enmascarado + las energías enmascaradas

[rows, columns] = size(A);

for i = 1:rows              %Igualamos las intensidades de los espectros
[A(i,:), B(i,:)] = leveling(A(i,:), B(i,:));
end

Ma = juntar(A,B);

energy = zeros(rows,1);
for i=1:rows
    energy(i) = sum(Ma(i,:));
end


masked = zeros(rows,columns);


for k=1:rows                %para cada beat
    [l, p] = orden(Ma(k,:));
    [~, maskers] = size(l);
    for i=1:maskers         %para cada pico enmascarante
        
        if p(i) ~= 0
            g = mask(p(i),l(i));

            for j=1:108        %Para cada frecuencia
        
                if (Ma(k,j) < g(j))  && (Ma(k,j)~=0)  
                    masked(k,j) = Ma(k,j);       %masked da las intensidades enmascaradas
                    Ma(k,j) = 0;
                    p(p==Ma(j)) = 0;

                    
                    
                end
    
            end

        end
        
            


    end
    
end



%Sumamos las intensidades enmascaradas en cada beat
masked2 = zeros(rows,1);
for i=1:rows
    if energy(i) ~=0
        masked2(i) = sum(masked(i,:)/energy(i));
    end
    
end
    
%Promediamos para todos los beats
masked2(masked2==0) = [];
count = sum(masked2)/rows;

end