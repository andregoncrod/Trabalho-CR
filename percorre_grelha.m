function nums = percorre_grelha(matriz)
flag = 0;
imgcount=0;
[lin, col] = size(matriz);
x_inicial = 1;
y_inicial = 1;
x_final = 1;
y_final = 1;
i=1;

while i ~= lin
    colunas=0;
    j=1;
    while j ~= col
        if(matriz(i,j) == 1)
            imgcount = imgcount + 1;
            colunas = colunas + 1;
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
            nums = zeros(x_final-x_inicial, y_final-y_inicial);

            k = 1;

            for l = x_inicial: x_final
                m = 1;
                for j = y_inicial: y_final
                    nums(k,m) = matriz(l,j);
                    m = m + 1;
                end
                k = k + 1;
            end
            t1=num2str(imgcount);
            t2=strcat('TE',t1);
            imwrite(nums, t2, 'bmp');

            j = y_final;
        end
        if(colunas == 9)
            i = x_final + 1;
            break;
        end
        j = j +1 ;
    end
    i = i + 1;
end
end