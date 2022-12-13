

notes = [33 35 37 39 41 44 46 49 52 55 58 62 ...
    65 69 73 78 82 87 93 98 104  110 117 123 ... 
    131 139 147 156 165 175 185 196 208 220 233 247 ...
    262 277 294 311 330 349 370 392 415 440 466 494 ...
    523 554 587 622 659 698 740 784 831 880 932 988 ...
    1047 1109 1175 1245 1319 1397 1480 1568 1661 1760 1865 1976 ...
    2093 2217 2349 2489 2637 2794 2960 3136 3322 3520 3729 3951 ...
    4186 4435 4699 4978 5274 5588 5920 6272 6645 7040 7459 7902 ...
    8372 8870 9397 9956 10548 11175 11840 12544 13290 14080 14917 15804];

%Comparamos melodias y acordes (acordes en harpa)
Z_Mcitarra = comparar(acordes,Mcitarra);
Z_Mharpa = comparar(acordes,Mharpa);
Z_Mdulcimer = comparar(acordes,Mdulcimer);
Z_Mguitarra = comparar(acordes,Mguitarra);
Z_Mpiano = comparar(acordes,Mpiano);
Z_Mvibrafono = comparar(acordes,Mvibraphone);

%----para los pitos:
Z_Pflauta = comparar(acordes,Pflauta);
Z_Pvibraphone = comparar(acordes, Pvibraphone);


%----pala los bajos

Z_Bbass = comparar(acordes,Bbass);
Z_Bbasses = comparar(acordes,Bbasses);
Z_Bcellos = comparar(acordes,Bcellos);
Z_Bpiano = comparar(acordes,Bpiano);
Z_Bsinte = comparar(acordes,Bsinte);
Z_Btuba = comparar(acordes,Btuba);

%Promediamos estas comparaciones:
promig_cit = promig(Z_Mcitarra);
promig_dulcimer = promig(Z_Mdulcimer);
promig_guitarra = promig(Z_Mguitarra);
%promig_bajo = promig(Z_bajo);
promig_piano = promig(Z_Mpiano);
promig_harpa = promig(Z_Mharpa);
promig_vibrafono = promig(Z_Mvibrafono);


%----Pitos
promig_Pcitarra = promig(Z_Pvibraphone);
promig_Pflauta = promig(Z_Pvibraphone);






%COUNT_MASKING



AvsMguitarraL =CountMasking(acordes,Mguitarra);
AvsMcitarraL =CountMasking(acordes,Mcitarra);
AvsMdulcimerL = CountMasking(acordes,Mdulcimer);
AvsMharpaL = CountMasking(acordes,Mharpa);
AvsMpianoL = CountMasking(acordes,Mpiano);
AvsMvibraphoneL = CountMasking(acordes,Mvibraphone);






%Here we plot the peaks of the compass c

c=5;

A_5 = Abalalaika(c,:);
B_5 = Bbass(c,:);
M_5 = Mvibraphone(c,:);
P_5 = Pflauta(c,:);

[b,p]=leveling(b,p);

li = 10;
ls = 100;

%plot(g);

subplot(2,1,1)
semilogx(notes(li:ls), A_5(li:ls), 'r*-',notes(li:ls),cit_5(li:ls),'b*-')
xlabel('Frequency (Hz)')
ylabel('Power (dB)');
title({'Single-sided Power spectrum' ...
    ' (Frequency in shown on a log scale)'});
axis tight  

subplot(2,1,2)
semilogx(notes(li:ls), A_5(li:ls), 'r*-',notes(li:ls),vib_5(li:ls),'b*-')
xlabel('Frequency (Hz)')
ylabel('Power (dB)');
title({'Single-sided Power spectrum' ...
    ' (Frequency in shown on a log scale)'});
axis tight  


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure
plot(X_padded);
ax = gca;
ax.FontSize = 14; 
xlabel('Bin number','FontSize',18,'Fontname','Times New Roman');
ylabel('Amplitude (arb. u.)','FontSize',18,'Fontname','Times New Roman'); 

subplot(2,1,1)
semilogx(notes(li:ls), A_5(li:ls), 'r*-', notes(li:ls), cit_5(li:ls), 'b*-',notes(li:ls), vib_5(li:ls), 'g*-');
%ritmo en azul, vib en rojo


bar(notes(li:ls),A_5(li:ls),'EdgeColor','r','BarWidth',0.001);
set(gca,'xscale','log')
ax = gca;
ax.FontSize = 14; 
xlabel('Frequency (Hz)','FontSize',18,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',18,'Fontname','Times New Roman'); 
grid off;

hold on

bar(notes(li:ls),B_5(li:ls),'EdgeColor','b','BarWidth',0.001);
set(gca,'xscale','log')
ax = gca;
ax.FontSize = 14; 
xlabel('Frequency (Hz)','FontSize',18,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',18,'Fontname','Times New Roman'); 
grid off;

hold on

bar(notes(li:ls),M_5(li:ls),'EdgeColor','y','BarWidth',0.001);
set(gca,'xscale','log')
ax = gca;
ax.FontSize = 14; 
xlabel('Frequency (Hz)','FontSize',18,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',18,'Fontname','Times New Roman'); 
grid off;

hold on

bar(notes(li:ls),P_5(li:ls),'EdgeColor','g','BarWidth',0.001);
set(gca,'xscale','log')
ax = gca;
ax.FontSize = 14; 
xlabel('Frequency (Hz)','FontSize',18,'Fontname','Times New Roman');
ylabel('Intensity (dB)','FontSize',18,'Fontname','Times New Roman'); 
grid off;
%acordes en azul, harpa en rojo


%%%%%%%%% ESTADÍSTICA
h=histogram(Zgood_5,13)
h.BinEdges = [10:10:110];
xlabel('Compatibily parameter (arb. u.)','FontSize',50,'Fontname','Times New Roman');
ylabel('Distribution function','FontSize',50,'Fontname','Times New Roman'); 
%h.BinWidth = 4
ax = gca;
ax.FontSize = 16; 
hold on

h=histogram(Zbad_5,13)
h.BinEdges = [10:10:110];
xlabel('Compatibily parameter (arb. u.)','FontSize',50,'Fontname','Times New Roman');
ylabel('Distribution function','FontSize',50,'Fontname','Times New Roman'); 
%h.BinWidth = 4
ax = gca;
ax.FontSize = 16; 


bar(10:10:130,ans)
ax = gca;
ax.FontSize = 14; 
xlabel('Compatibily parameter (arb. u.)','FontSize',18,'Fontname','Times New Roman');
ylabel('Number of repetitions','FontSize',18,'Fontname','Times New Roman'); 
grid off;


subplot(2,1,1)
bar(Zgood_5)
xlim([1 50])
txt = '(a)';
text(25,90,txt,'FontSize',18,'Fontname','Times New Roman');
ax = gca;
ax.FontSize = 14; 
ylim([0 100])
xlabel('Beat number','FontSize',18,'Fontname','Times New Roman');
ylabel('CP (arb. u.)','FontSize',18,'Fontname','Times New Roman'); 
grid off;

subplot(2,1,2)
bar(Zbad_5)
txt = '(b)';
text(25,90,txt,'FontSize',18,'Fontname','Times New Roman');ax = gca;
xlim([1 50])
ax.FontSize = 14; 
xlabel('Beat number','FontSize',18,'Fontname','Times New Roman');
ylabel('CP (arb. u.)','FontSize',18,'Fontname','Times New Roman'); 
grid off;


