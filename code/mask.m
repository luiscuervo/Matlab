function Y = mask(I,P)
%Recoge la intensidad I(db) y la posición frecuencial (binNum) del sonido enmascarante 
%y devuelve el threshold de las frecuencias cercanas. 

if P<=48
    load('m250Hz');
    A = m250Hz;
    centre = 36;        
    
elseif (48 < P) && (P < 73)
    load('m1k');
    A = m1k;
    centre = 60;

    
elseif P >= 73
    load('m4k');
    A = m4k;
    centre = 84;

end
    

%ajustamos la posición de la curva
if P > centre
    d=P-centre;         %d = distancia del pico a 1khz
    Y=[zeros(1,d) A(1:108-d)];     
    
elseif P<centre
    d=centre-P;
    Y=[A zeros(1,d)];
    Y(1:d) = [];
else
    Y=A;
end

%ahora ajustamos la altura de la curva
Igap= 60 - I;

for i=1:108
Y(i) = Y(i) - Igap;
end

Y(Y==-Igap)=0;
Y(Y<=0)=0;

end



