%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [success] = RP2D(cube,L,S,max_C)

d=floor(S/2);
x=floor(rand(1,1).*((L-d)-(d)))+(d+1);  % choosing a site within the cube, eg., for L=27 and d=4; 5<=x<=23
y=floor(rand(1,1).*((L-d)-(d)))+(d+1);
success=zeros(max_C,1);

for c=1:max_C
    if (cube(x,y)==c)
        success(c)=1;
    end
end

for i=1:d
    for c=1:max_C
        if (cube(x+i,y)==c)
            success(c)=1;
        elseif (cube(x-i,y)==c)
            success(c)=1;
        elseif (cube(x,y+i)==c)
            success(c)=1;
        elseif (cube(x,y-i)==c)
            success(c)=1;
        end
    end
end
end
