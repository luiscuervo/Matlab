function TM = TotalMask(M)
%coge un espectro de canción y devuelve el efecto de enmascaramiento total
%en cada beat

[rows, columns] = size(M);

TM = zeros(rows, columns);

for i=1:rows
    for j=1:columns
        if M(i,j)~= 0
            TM(i,:)= TM(i,:) + mask(M(i,j),j);
        end
    end
end

end