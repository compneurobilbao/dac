%
% Divide and conquer (DAC) strategy for tumor sampling
% Asier Erramuzpe, Biocruces
% March 10, 2016


function [cube] = grow_punctuated(cube,new_color)

L = size(cube,1);

colors = unique(cube);
if colors(1) == 0
    colors(1) = [];
else
    return
end

for idx=1:length(colors)
    value = colors(idx);
    [x,y] = find(cube==value);
    
    if max(x) == L
        max_x = L;
    else
        max_x = max(x)+1;
    end
    
    if max(y) == L
        max_y = L;
    else
        max_y = max(y)+1;
    end
    
    if min(x) == 1
        min_x = 1;
    else
        min_x = min(x)-1;
    end
    
    if min(y) == 1
        min_y = 1;
    else
        min_y = min(y)-1;
    end
    
    pixels = combvec(min_x:max_x,min_y:max_y);

    for i=1:length(pixels)
        xy = pixels(:,i);
        if cube(xy(1),xy(2)) == 0 || cube(xy(1),xy(2))<value
            cube(xy(1),xy(2))  = value;
        end
    end
    
end
   
    
if new_color ~= 0
    x=floor(L/2)+1;
    y=floor(L/2)+1;
    cube(x,y)=new_color;
end

end
