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
