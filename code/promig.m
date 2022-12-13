function P = promig(Z)

%[rows, columns] = size(Z);

Z_2 = Z.^2;

P = sqrt(sum(Z_2));

end