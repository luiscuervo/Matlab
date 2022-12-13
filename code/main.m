
%First we create the 3D matrixes with all the instruments. The function
%cat() concatenates all the matrixes in the third dimension.

C=cat(3,Abalalaika,Acitarra,Aguitarra,Aharpa,Aharpicordio,Apiano,Asinte);
%7 instruments playing the chords

B=cat(3,Bsinte,Bcellos,Bbasses,Bbass,Btuba);   
%5 instruments playing the bass

M=cat(3,Mharpa,Mguitarra,Mharpicordio,Mpiano,Msinte,Mcelesta,Mcitarra,Mvibraphone);
%8 instruments playing the melody

P=cat(3,Pvibraphone,Pflauta,Ppiano,Pviolin,Poboe,Porgan);    
%6 instruments playing the high-pitch



Z=zeros(7,5,8,6);   %We will store our results in this matrix

for i = 1:7
    for j = 1:5
        for k = 1:8
            for l=1:6
                %The function juntarR() joins the spectrum of two scores,
                %taking into account masking and that our values are
                %logarithmic.
                
                %We created 4 matrixes that contain the whole spectrum except for
                %one instrument.
                
                NoC=juntarR(juntarR(HP(:,:,l),B(:,:,j)),M(:,:,k));
                NoB=juntarR(juntarR(HP(:,:,l),C(:,:,i)),M(:,:,k));
                NoHP=juntarR(juntarR(C(:,:,i),B(:,:,j)),M(:,:,k));
                NoM=juntarR(juntarR(HP(:,:,l),B(:,:,j)),C(:,:,i));
                
                %Next we compare each instrument with the rest combined.
                %The function comparar() returns a CP value for each beat.

                Afit=comparar(C(:,:,i),NoC);
                Bfit=comparar(B(:,:,j),NoB);
                Mfit=comparar(M(:,:,k),NoM);
                Pfit=comparar(HP(:,:,l),NoHP);
                

                %Finally we compute the average of these last 4 matrixes
                %(for the average value along the  beats) and save the result 
                %into the matrix Z.
                Z(i,j,k,l)= (mitjana(Afit) + mitjana(Bfit) + ...
                    mitjana(Pfit) + mitjana(Mfit))/4;
            end
        end
    end
end
%---------
