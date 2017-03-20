%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run main.m


function [cube] = creates_cube2D(L)

cube=zeros(L,L);

x=floor(L/2)+1;
y=floor(L/2)+1;
c=1;

cube(x,y)=c;

end
