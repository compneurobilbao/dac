%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [cube,list] = creates_regional_ITH_cube2D(L,H,C)


cube=zeros(L,L);
x=floor(rand(1,1).*(L))+1;
y=floor(rand(1,1).*(L))+1;
c=floor(rand(1,1).*(C))+1;

cont=1;

cube(x,y)=c;

list=[];

list=[list; x y];
    
    
while (cont<H)
    
    x=floor(rand(1,1).*(L))+1;
    y=floor(rand(1,1).*(L))+1;
    c=floor(rand(1,1).*(C))+1;
    
    for i=1:size(list,1);
        
        xx=list(i,1);
        yy=list(i,2);
        
        if (   ( ( (x==xx+1) && (y==yy) ) || ( (x==xx-1) && (y==yy) ) || ( (x==xx) && (y==yy+1) )   ||  ( (x==xx) && (y==yy-1) )  )    && ((x>=1) && (x<=L) && (y>=1) && (y<=L)) && (cube(x,y)==0) )
            
            cube(x,y)=c;
            cont=cont+1;
            list=[list; x y];
            
            
            
        end
        
       
        
        
    end
    
    
    
end


end
