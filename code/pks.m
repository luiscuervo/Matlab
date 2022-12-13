function [P, L] = pks(data,A,B)
% A y B son el bin number de los limites del segmento a estudiar(A<B)
% Hace la FFT (con windowing y zero-padding) y devuelve dos vectores:
% P -> intensidad del pico   y   L -> Posición del pico

N=length(data(A:B));
fs=44100;
H= hanning(length(data(A:B))) ;
X_windowed= data(A:B).*H ;

if B-A < 441000        %441000 is the disired length to obtain ∆f=0.1Hz
    pad = 441000 - N;
else 
    pad=1;
end

X_padded=[transpose(X_windowed) zeros(1,pad)];  %with padding 5*N we obtain a freq resolution of aprox 0,01 Hz
Npad=length(X_padded);

bin_vals = 0 : Npad-1;
fax_Hz = bin_vals*fs/Npad;  %frequency axis in hertz

spectrum = abs(fft(X_padded));

Y=20*log10(spectrum);
%Z=log10(fax_Hz);
Y(Y<0)=0;

N_1=round(20*Npad/fs);
N_2=round(22050*Npad/fs) ;

[P, L] = findpeaks(Y(N_1:N_2), fax_Hz(N_1:N_2));%, 'MinPeakDistance', 10)%, 'MinPeakProminence', 40);

end

