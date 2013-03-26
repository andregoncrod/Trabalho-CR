function nova=swap(matriz)

[lin, col] = size(matriz);
nova = zeros(lin,col);
for i=1:lin
    for j=1:col
        if(matriz(i,j) == 0)
            nova(i,j) = 1;
        end
        if(matriz(i,j) == 1)
            nova(i,j) = 0;
        end
    end
end
end