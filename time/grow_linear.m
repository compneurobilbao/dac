%
% Divide and conquer (DAC) strategy for tumor sampling
% Asier Erramuzpe, Biocruces
% March 10, 2016


function [cube] = grow_linear(cube,new_color)

L = size(cube,1);
grow_rate = 3;

colors = unique(cube);
if colors(1) == 0
    colors(1) = [];
end
colors = fliplr(colors');

for idx=1:length(colors)
    value = colors(idx);
    [x,y] = find(cube==value);
    
    if (max(x) + grow_rate) > L
        max_x = L;
    else
        max_x = max(x)+grow_rate;
    end
    
    if (max(y) + grow_rate) > L
        max_y = L;
    else
        max_y = max(y)+grow_rate;
    end
    
    if (min(x) - grow_rate) < 1
        min_x = 1;
    else
        min_x = min(x)-grow_rate;
    end
    
    if (min(y) - grow_rate) < 1
        min_y = 1;
    else
        min_y = min(y)-grow_rate;
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
    x=floor(L/2);
    y=floor(L/2);
    cube(x,y)=new_color;
end

end
