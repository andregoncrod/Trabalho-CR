function teste()

[a, map] = imread('sudoku1.bmp');

matriz = limpa_matriz(a);

imwrite(matriz, 'Teste_2', 'BMP');

numeros = percorre_grelha(matriz);

end