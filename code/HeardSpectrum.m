function MM= HeardSpectrum(data,bpm)
%Devuelve el espectro discreto en cada beat con masking y QT

M=sketch(data,bpm);

[rows, columns] = size(M);

Ma= zeros(rows,columns);
for i= 1:rows
    Ma(i,:) = fullmask(M(i,:));     %masking
end

MM = Threshold(Ma);                 %Quiet threshold

end

