%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [success,positions] = DAC2D(cube,L,S,max_C)

d=floor(S/2);

trials_number=4*d+1;

positions=zeros(L,L);



success=zeros(max_C,1);




while (sum(nonzeros(positions))<trials_number)
    
    x=floor(rand(1,1).*L)+1;  % choosing a site within the cube 
    y=floor(rand(1,1).*L)+1;
    
    
    if positions(x,y)==0
        
        for c=1:max_C
            
            if (cube(x,y)==c)
                success(c)=1;
            end
        end
        
        
        
        
        positions(x,y)=1;
        
    end
    
    
    
    
    
end




end
