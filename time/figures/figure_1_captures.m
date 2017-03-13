clear all;
clc;
addpath('../');

S=33;        % scale, odd number
L=3*S;      % cube side 
t=100;      % 100, number of timesteps

max_C=4;  % ITH types
max_trials=1;  % 500, for each value of H, we apply separately each strategy N=max_trials and compute mean +- standard deviation
max_tumor_number=1;  % 15, also averaging over different tumors



%%%%%%% linear %%%%%%%%%
tumor_evolution='linear';  %'random' or 'regional'

cube = creates_cube2D(L);

if (strcmp(tumor_evolution,'linear'))
    colors = 2:max_C;
    poisson_lambda = t/(max_C*4);
    t_aux = 0;
end
  
figure
hold on;
h_old = imagesc(cube,[0 max_C]);

for timepoint=1:t

% creates an heteregeneous cube with ITH given by max_H
% and ITH types  equal to C

    if (strcmp(tumor_evolution,'linear'))
        color_cube = unique(cube);
        if poissrnd(t_aux) > poisson_lambda && ~isempty(colors) && length(color_cube) < 2
            t_aux = 0;
            new_color = colors(1);
            colors(1) = [];
            cube = grow_linear(cube,new_color);
        else
            t_aux = t_aux + 1;
            cube = grow_linear(cube,0);
        end


    end
    h=imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    delete(h_old);
    h_old=h;
    drawnow;
    if timepoint == 10
        print('linear_caption_begin','-depsc')
    elseif timepoint == 90
        print('linear_caption_end','-depsc')
        break
    end 
end
close all

%%%%%%% branch %%%%%%%%%
tumor_evolution='branch';  %'random' or 'regional'

cube = creates_cube2D(L);

figure
hold on;
h_old = imagesc(cube,[0 max_C]);
cube = creates_cube2D(L);
appearance_ratio = 1/(t/20); % it appears 5 times in mean
record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]

for timepoint=1:t

    % creates an heteregeneous cube with ITH given by max_H
    % and ITH types  equal to C

    if (strcmp(tumor_evolution,'branch'))
        if appearance_ratio > rand(1,1)
            c=floor(rand(1,1).*(max_C))+1;
            [cube, record] = grow_branch(cube,timepoint/t,c, record);
        else
            [cube, record] = grow_branch(cube,timepoint/t,0, record);
        end
    end
    
    h=imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    delete(h_old);
    h_old=h;
    drawnow;
    
    if timepoint == 10
        print('branch_caption_begin','-depsc')
    elseif timepoint == 90
        print('branch_caption_end','-depsc')
        break
    end 
end
close all


%%%%%%% neutral %%%%%%%%%
tumor_evolution='neutral';  %'random' or 'regional'


cube = creates_cube2D(L);

if (strcmp(tumor_evolution,'neutral'))
    appearance_ratio = 1/(t/100); % it appears 50 time in mean
    record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]
end

figure
hold on;
h_old = imagesc(cube,[0 max_C]);

for timepoint=1:t

% creates an heteregeneous cube with ITH given by max_H
% and ITH types  equal to C

    if (strcmp(tumor_evolution,'neutral'))
        if appearance_ratio > rand(1,1)
                c=floor(rand(1,1).*(max_C))+1;
                [cube, record] = grow_neutral(cube,timepoint/t,c, record);
        else
            [cube, record] = grow_neutral(cube,timepoint/t,0, record);
        end
    end
    h=imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    delete(h_old);
    h_old=h;
    drawnow;
    
    if timepoint == 10
        print('neutral_caption_begin','-depsc')
    elseif timepoint == 90
        print('neutral_caption_end','-depsc')
        break
    end 
end
close all


%%%%%%% punctuated %%%%%%%%%
tumor_evolution='punctuated';  %'random' or 'regional'


cube = creates_cube2D(L);

if (strcmp(tumor_evolution,'punctuated'))
    colors = 2:max_C;
end
  
figure
hold on;
h_old = imagesc(cube,[0 max_C]);


for timepoint=1:t

% creates an heteregeneous cube with ITH given by max_H
% and ITH types  equal to C

    if ~isempty(colors) && mod(timepoint,2) && timepoint~=1
        new_color = colors(1);
        colors(1) = [];
        cube = grow_punctuated(cube,new_color);
    else
        cube = grow_punctuated(cube,0);
    end


    h=imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    delete(h_old);
    h_old=h;
    drawnow;
    
    if timepoint == 10
        print('punctuated_caption_begin','-depsc')
    elseif timepoint == 90
        print('punctuated_caption_end','-depsc')
        break
    end 
end
close all