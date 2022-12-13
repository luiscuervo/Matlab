
A=cat(3,Abalalaika,Acitarra,Aguitarra,Aharpa,Aharpicordio,Apiano,Asinte);    

B=cat(3,Bsinte,Bcellos,Bbasses,Bbass,Btuba);   

M=cat(3,Mharpa,Mguitarra,Mharpicordio,Mpiano,Msinte,Mcelesta,Mcitarra,Mvibraphone);

P=cat(3,Pvibraphone,Pflauta,Ppiano,Pviolin,Poboe,Porgan);    

%Diferentes count Masking

Zm=zeros(7,5,8,6);
for i = 1:7
    for j = 1:5
        for k = 1:8
            for l=1:6
            AB=juntar(A(:,:,i),B(:,:,j));
            PM=juntar(M(:,:,k),P(:,:,l));
            
            Zm(i,j,k,l)=CountMasking(AB,PM);
            
            end
        end
    end
end

%Diferentes products

Z=zeros(7,5,8,6);
for i = 1:7
    for j = 1:5
        for k = 1:8
            for l=1:6
                NoA=juntarR(juntarR(P(:,:,l),B(:,:,j)),M(:,:,k));
                NoB=juntarR(juntarR(P(:,:,l),A(:,:,i)),M(:,:,k));
                NoP=juntarR(juntarR(A(:,:,i),B(:,:,j)),M(:,:,k));
                NoM=juntarR(juntarR(P(:,:,l),B(:,:,j)),A(:,:,i));

                Afit=comparar(A(:,:,i),NoA);
                Bfit=comparar(B(:,:,j),NoB);
                Mfit=comparar(M(:,:,k),NoM);
                Pfit=comparar(P(:,:,l),NoP);

            
                Z(i,j,k,l)= (mitjana(Afit) + mitjana(Bfit) + mitjana(Pfit) + mitjana(Mfit))/4;
            end
        end
    end
end
%---------

%Luis es minimo en 2,5,1,3 y maximo en melodia con piano (Stenwaaay)

%POMPA

A=violin1;

B=violin2;

P=viola;

M=cello;



Zp=zeros(2,2,2,2);
for i = 1:2
    for j = 1:2
        for k = 1:2
            for l=1:2
                NoA=juntarR(juntarR(P(:,:,l),B(:,:,j)),M(:,:,k));
                NoB=juntarR(juntarR(P(:,:,l),A(:,:,i)),M(:,:,k));
                NoP=juntarR(juntarR(A(:,:,i),B(:,:,j)),M(:,:,k));
                NoM=juntarR(juntarR(P(:,:,l),B(:,:,j)),A(:,:,i));

                Afit=comparar(A(:,:,i),NoA);
                Bfit=comparar(B(:,:,j),NoB);
                Mfit=comparar(M(:,:,k),NoM);
                Pfit=comparar(P(:,:,l),NoP);

            
                Zp(i,j,k,l)= (mitjana(Afit) + mitjana(Bfit) + mitjana(Pfit) + mitjana(Mfit))/4;
            end
        end
    end
end



%PARA COMPARAR UN SOLO INSTRUMENTO
P=cat(3,Pflauta,Poboe,Porgan,Ppiano,Pvibraphone,Pviolin);
ZZ=zeros(1,6);

for i=1:6
    X=comparar(P(:,:,i),acomp);
    ZZ(i)=mitjana(X);
end
