function nums = percorre_grelha(matriz)
flag = 0;
[lin, col] = size(matriz);
x_inicial = 1;
y_inicial = 1;
x_final = 1;
y_final = 1;
for i = 1: lin
    for j=1: col
        if(matriz(i,j) == 1)
            x_inicial = i;
            y_inicial = j;
            for k = x_inicial: lin
                if(matriz(k, y_inicial) == 0)
                   x_final = k-1; 
                   break;
                end
            end
            for k = y_inicial: col
                if(matriz(x_inicial, k) == 0)
                   y_final = k-1;
                   break;
                end
            end
            flag = 1;
            break;
        end
    end
    if(flag == 1)
        break;
    end
end

nums = zeros(x_final-x_inicial, y_final-y_inicial);


k = 1;

for i = x_inicial: x_final
    m = 1;
    for j = y_inicial: y_final
        nums(k,m) = matriz(i,j);
        m = m + 1;
    end
    k = k + 1;
end

imwrite(nums, 'TE', 'bmp');

end