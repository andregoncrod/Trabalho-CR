function NUMS=teste()

clc;

[a, map] = imread('6a00d83426b77b53ef00e54f3ffcb08833-800wi.bmp');

matriz = limpa_matriz(a);

imwrite(matriz, 'Teste_1', 'BMP');

NUMS = percorre_grelha(matriz);

end