function Ma = fullmask(Ma)
%Devuelve el espectro enmascarado de un beat

[l, p] = orden(Ma);
[~, maskers] = size(l);

for i=1:maskers
    if p(i) ~= 0
        g = mask(p(i),l(i));

        for j=1:length(Ma)
        
            if (Ma(j) < g(j)) && (Ma(j)~= 0)
                p(p==Ma(j)) = 0;
                Ma(j) = 0;
                
            end 
    
        end
    end
    
end

end

