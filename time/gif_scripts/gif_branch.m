clear all;
clc;


S=33;        % scale, odd number
L=3*S;      % cube side 
t=100;      % 100, number of timesteps

max_C=4;  % ITH types
max_trials=1;  % 500, for each value of H, we apply separately each strategy N=max_trials and compute mean +- standard deviation
max_tumor_number=1;  % 15, also averaging over different tumors
tumor_evolution='branch';  %'random' or 'regional'

cube = creates_cube2D(L);

figure
hold on;
h_old = imagesc(cube,[0 max_C]);

filename = 'branch.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

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
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
    
    if timepoint == 10
        print('neutral_caption_begin','-deps')
    elseif timepoint == 90
        print('neutral_caption_end','-deps')
        break
    end 
end





