%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Necessary function to run simula2D.m


function [cube, record] = grow_neutral(cube,time_ratio,new_color,record)

L = size(cube,1);

for idx=1:size(record,1)

    x = record(idx,1);
    y = record(idx,2);
    color = record(idx,3);
    step = record(idx,4);

    if step == 8
        continue
    else
        pixels = combvec(x-step:x+step,y-step:y+step);

        x = pixels(1,:);
        y = pixels(2,:);

        if max(x) >= L
            max_x = L;
        else
            max_x = max(x)+1;
        end

        if max(y) >= L
            max_y = L;
        else
            max_y = max(y)+1;
        end

        if min(x) <= 1
            min_x = 1;
        else
            min_x = min(x)-1;
        end

        if min(y) <= 1
            min_y = 1;
        else
            min_y = min(y)-1;
        end

        pixels = combvec(min_x:max_x,min_y:max_y);

        for i=1:length(pixels)
            xy = pixels(:,i);
            if (time_ratio < 0.2 && step < 8) || (time_ratio < 0.4 && step < 6) ||...
                    (time_ratio > 0.4 && step < 4)
                cube(xy(1),xy(2))  = color;
            end
        end
        record(idx,4) = step+1;
    end   
    
end  
    
if new_color ~= 0
    if ~isempty(find(cube == 0))
        [x_vec, y_vec] = find(cube == 0);
        idx = floor(rand(1,1).*(length(x_vec)))+1;
        x = x_vec(idx);
        y = y_vec(idx);
    else            
        x=floor(rand(1,1).*(L))+1;
        y=floor(rand(1,1).*(L))+1;
    end
    cube(x,y)=new_color;
    record = [record; x y new_color 0]; % record = [x y color growing_step]
end

end
