data(:,2) =[];

N=length(data);
duration=N/fs ; %duration of the signal
%t=linspace(0,duration,N);

%figure
%plot(t,X_padded);
%ax = gca;
%ax.FontSize = 14; 
%xlabel('Time (s)','FontSize',18,'Fontname','Times New Roman');
%ylabel('Normalised Intensity','FontSize',18,'Fontname','Times New Roman'); 

X = data;%(compass(8):compass(9));
Ns = length(X);

bpm = 120;
beat = duration/60 * bpm;
compass = [1:round(Ns/beat):Ns N];    %this vector gives bin value of the start of each compass



pad=441000-length(data);

H= hanning(Ns);
X_windowed= X.*H ;
X_padded=[transpose(X_windowed) zeros(1,pad)];  %with padding 5*N we obtain a freq resolution of 0,015 Hz
Npad=length(X_padded);                          %(for fs= 44100)

%plot(X);
bin_vals = [0 : Npad-1];
fax_Hz = bin_vals*fs/Npad;  %frequency axis in hertz

spectrum = abs(fft(X_padded));

Y = 20*log10(spectrum);
Y(Y<0)=0;

N_1=20*Npad/fs;
N_2=22050*Npad/fs; 
semilogx(fax_Hz(N_1:N_2),Y(N_1:N_2))
ax = gca;
ax.FontSize = 20; 
ax.XLim = [20 10000];
xlabel('Frequency (Hz)','FontSize',25,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',25,'Fontname','Times New Roman'); 
grid off;

[P, L] = findpeaks(Y(N_1:N_2), fax_Hz(N_1:N_2),'MinPeakHeight', 1)%, 'MinPeakDistance', 20, 'MinPeakProminence', 40);

[P_1, L_1]=pks(data,compass(1),compass(2));

bar(L_1,P_1,'EdgeColor','b','FaceColor','b','BarWidth',0.001);
set(gca,'xscale','log')
ax = gca;
ax.FontSize = 20; 
ax.XLim = [20 10000];
%text(80,55,txt,'FontSize',18,'Fontname','Times New Roman');
xlabel('Frequency (Hz)','FontSize',25,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',25,'Fontname','Times New Roman'); 
grid off;

[pks, locs,w,p]= findpeaks(spectrum(N_1:N_2), fax_Hz(N_1:N_2),'MinPeakHeight',2,'MinPeakDistance',40,'MinPeakProminence',4);
%plot(locs,pks);



subplot(2,1,1)
semilogx(fax_Hz(N_1:N_2), 20*log10(spectrum(N_1:N_2)))
xlabel('Frequency (Hz)')
ylabel('Power (dB)');
title({'Single-sided Power spectrum' ...
    ' (Frequency in shown on a log scale)'});
axis tight  

subplot(2,1,2)
semilogx(locs, 20*log10(pks))
xlabel('Frequency (Hz)')
ylabel('Power (dB)');
title({'Single-sided Power spectrum' ...
    ' (Frequency in shown on a log scale)'});
axis tight  



%data(:,2) =[];
fs=44100;
N = length(data) ;
duration=N/fs ;   %duration of the signal

bpm=113;
beat = duration/60 * bpm;
compass = [1:round(N/beat):N N];    %this vector gives bin value of the start of each compass


[A, B, W, P]=pks(data,compass(3),compass(4));
   