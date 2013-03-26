function [ bool ] = verifica_se_zero( A )
%VERIFICA_SE_ZERO 
%   Retorna zero se nao for casa vazia

[l,c]=size(A);
bool=1;

for i=1 : l
    for j=1 : c
        if(A(i,j)~=0)
            bool=0;
    end
    end
if(bool==1)
    bool=1;
end
if(bool==0)
    bool=0;
end

end

