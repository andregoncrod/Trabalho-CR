function matriz = limpa_matriz(aux)
flag_paragem = 0;
[lin,col] = size(aux)
x_inicial = 0;
y_inicial = 0;
x_final = 0;
y_final = 0;


%Entrada no ciclo for
    for i=1:lin
        for j=1: col
            if(aux(i,j) == 0)
                flag_paragem = 1;
                x_inicial = i
                y_inicial = j
                break;
            end
        end
        if(flag_paragem == 1)
            break;
        end
    end
% Saida do ciclo for

%Entrada no ciclo for
flag_paragem = 0;
    for i=lin:-1:1
        for j=col:-1: 1
            if(aux(i,j) == 0)
                flag_paragem = 1;
                x_final = i
                y_final = j
                break;
            end
        end
        if(flag_paragem == 1)
            break;
        end
    end
% Saida do ciclo for

k=1;
matriz = zeros(x_final-x_inicial, y_final-y_inicial);

for i=x_inicial:x_final
    m = 1;
    for j=y_inicial:y_final
        matriz(k,m) = aux(i,j);
        m = m + 1;
    end
    k = k + 1;    
end   
end