function NUMS=teste()

clc;

[a, map] = imread('sudoku1.bmp');

matriz = limpa_matriz(a);

imwrite(matriz, 'Teste_2', 'BMP');

NUMS = percorre_grelha(matriz);

end