function NUMS = percorre_grelha(matriz)
flag = 0;
imgcount=0; %contador do numero de numeros do tabuleiro sudoku para dar nome as imagens criadas
[lin, col] = size(matriz);
x_inicial = 1;  %valor  x inicial de um numero
y_inicial = 1;  %valor  y inicial de um numero
x_final = 1;    %valor  x final de um numero
y_final = 1;    %valor  y final de um numero
i=1;    %contador para percorrer linhas matriz
NUMS={};    %array de celulas para guardar arrays de pixeis dos numeros da tabela
linhas_nums=1;  %numero da linha actual a preencher no array de celulas

%ciclo para correr as linhas da imagem do sudoku
while i ~= lin    
    colunas_nums=0;%numero da coluna actual a preencher no array de celulas
    j=1;
    %ciclo para correr as colunas da imagem do sudoku
    while j ~= col
        if(matriz(i,j) == 1)    %se o pixel da imagem for branco quer dizer que é um quadrado de numero
            imgcount = imgcount + 1;    
            colunas_nums = colunas_nums + 1;
            x_inicial = i;
            y_inicial = j;
            %ciclo para descobrir a linha final do quadrado do numero
            for k = x_inicial: lin
                if(matriz(k, y_inicial) == 0) %se for preto guarda o numero
                   x_final = k-1; 
                   break;
                end
            end
            %ciclo para descobrir a coluna final do quadrado do numero
            for k = y_inicial: col
                if(matriz(x_inicial, k) == 0)   %se for preto guarda o numero
                   y_final = k-1;
                   break;
                end
            end
            nums = zeros(x_final-x_inicial, y_final-y_inicial); %cria uma matriz de zeros para guardar os pixeis do numero encontrado

            k = 1;
            
            %ciclo para atribuir ao array nums os valores dos pixeis do
            %numero analisado
            for l = x_inicial: x_final
                m = 1;
                for j = y_inicial: y_final
                    nums(k,m) = matriz(l,j);
                    m = m + 1;
                end
                k = k + 1;
            end
%<<<<<<< HEAD
            %NUMS{linhas_nums,colunas_nums}=nums;    %guardar array de pixeis do numero analisado no array de celulas
            %criação da imagem do numero actual com o nome e numro da
            %imagem
            %t1=num2str(imgcount);
            %t2=strcat(t1,'.bmp');
            %t3=strcat('testes/',t2);
            %imwrite(nums, t3);

            %j = y_final;    %alterar o j para saltar o espaço branco do numero ja guardado, avançar nas colunas
%=======
            t1=num2str(imgcount);
            t2=strcat(t1,'.bmp');
            t3=strcat('testes/',t2);
            
            numTESTE = swap(nums);
            BW3 = bwmorph(numTESTE,'thin',Inf);
            numDONE = swap(BW3);
            threshold = graythresh(numDONE);
            numDONE =~im2bw(numDONE,threshold);
            if(verifica_se_zero(numDONE)==0)
                [FINAL,L]=lines(numDONE);
                FINAL=imresize(FINAL,[15 15]);
                FINAL=swap(FINAL);
                imwrite(FINAL, t3);
                NUMS{linhas_nums,colunas_nums}=FINAL;
            end
            %imshow(FINAL);
            %BW3 = bwmorph(numDONE,'thin',Inf);
    
            j = y_final;
%>>>>>>> Reduzir numeros um pixel de largura
        end
        if(colunas_nums == 9)   %apos chegar ao fim de uma linha de numeros, 9 
            linhas_nums = linhas_nums + 1;  %incrementar a linha na matriz de celulas
            i = x_final + 1;    %alterar o i para saltar o espaço branco do numero ja guardado, avançar nas linhas
            break;
        end
        j = j +1 ;
    end
    i = i + 1;
end
end