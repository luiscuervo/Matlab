function M = juntar(A,B)


Pa = 10.^(0.05*A);

Pb = 10.^(0.05*B);


M = Pb + Pa;
M(M==2) = 1;

M = 20*log10(M);



end