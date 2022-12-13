function N = AverageMasking(M)

[rows, ~] = size(M);

masked2 = zeros(rows,1);
for i=1:rows
    masked2(i) = sum(M(i,:));
end

N=sum(masked2)/rows;

end
    