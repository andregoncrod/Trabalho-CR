function NUMS=teste()

clc;

[a, map] = imread('sudokudavid.bmp');

matriz = limpa_matriz(a);

imwrite(matriz, 'Teste_1.bmp');

NUMS = percorre_grelha(matriz);

end