clear all;
clc;


S=33;        % scale, odd number
L=3*S;      % cube side 
t=100;      % 100, number of timesteps

max_C=5;  % ITH types
max_trials=1;  % 500, for each value of H, we apply separately each strategy N=max_trials and compute mean +- standard deviation
max_tumor_number=1;  % 15, also averaging over different tumors
tumor_evolution='punctuated';  %'random' or 'regional'


cube = creates_cube2D(L);

if (strcmp(tumor_evolution,'punctuated'))
    colors = 2:max_C;
end
  
figure
hold on;
h_old = imagesc(cube,[0 max_C]);

filename = 'punctuated.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

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
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end



