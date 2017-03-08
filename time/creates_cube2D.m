%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [cube] = creates_cube2D(L,H,C)

cube=zeros(L,L);
cont=0;

while (cont<H)
    x=floor(rand(1,1).*(L))+1;
    y=floor(rand(1,1).*(L))+1;
    c=floor(rand(1,1).*(C))+1;

    if cube(x,y) ~= 0
    else
        cube(x,y)=c;
        cont=cont+1;    
    end
end
end
