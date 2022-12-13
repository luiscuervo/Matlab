function X = musicspectrum(L,Pks)
%L=locations and P = peak intensity. Must be the same length.
%This function returns the spectrum in terms of musical notes.
notes = [33 35 37 39 41 44 46 49 52 55 58 62 ...
    65 69 73 78 82 87 93 98 104  110 117 123 ... 
    131 139 147 156 165 175 185 196 208 220 233 247 ...
    262 277 294 311 330 349 370 392 415 440 466 494 ...
    523 554 587 622 659 698 740 784 831 880 932 988 ...
    1047 1109 1175 1245 1319 1397 1480 1568 1661 1760 1865 1976 ...
    2093 2217 2349 2489 2637 2794 2960 3136 3322 3520 3729 3951 ...
    4186 4435 4699 4978 5274 5588 5920 6272 6645 7040 7459 7902 ...
    8372 8870 9397 9956 10548 11175 11840 12544 13290 14080 14917 15804];

X = zeros(1,length(notes));

%Añadir una función que, en caso de que haya dos picos en la misma nota,
%coje la más alta

for i = 1:length(L)
    for j = 1:length(notes)
    if (L(i) >= notes(j)*0.98) && (L(i) <= notes(j)*1.02)
        
        if X(j) < Pks(i)        %para cuando se repiten picos
            X(j) = Pks(i);
        end
            
    end
    end
    
end

end

