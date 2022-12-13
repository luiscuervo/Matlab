function M = sketch(data,bpm)
%Returns discretised spectrum

data(:,2) =[];
fs=44100;
N = length(data) ;
duration=N/fs ;   %duration of the signal

beatnum = duration/60 * bpm;
beats = [1:ceil(N/beatnum):N N];    %this vector gives bin value of the start of each compass


%To plot our signal and its compasses:

%Duration=N/fs ;   %duration of the signal
%bin_num= 0:N-1;
%compass_height = zeros(1,length(compass));

%plot(bin_num, data, compass,compass_height , 'c*');
%xlabel('bin');
%ylabel('Amplitude');
%title('Time-Domain Signal to be analysed');


%Here we created a loop in which we calculate the harmonics within each
%segment

M = zeros(length(beats)-1,108);

for i=1:length(beats)-1
    [PKS, LOCS] = pks(data,beats(i),beats(i+1)) ;
    M(i,:) = musicspectrum(LOCS,PKS);

end

end
