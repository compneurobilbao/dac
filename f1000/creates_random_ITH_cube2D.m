%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [cube,list] = creates_random_ITH_cube2D(L,H,C)


cube=zeros(L,L);
cont=0;
list=[];



while (cont<H)
    
    x=floor(rand(1,1).*(L))+1;
    y=floor(rand(1,1).*(L))+1;
    c=floor(rand(1,1).*(C))+1;

    
    
    if cube(x,y) ~= 0
    else 
            cube(x,y)=c;
            cont=cont+1;
            
            list=[list; x y];
            
        
    end
    
    
    
end


end
