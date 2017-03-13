clear all;
clc;


load('linear.mat')

figure;
hold on;

filename = 'linear_performance.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

cube = creates_cube2D(L);

if (strcmp(tumor_evolution,'linear'))
    colors = 2:max_C;
    poisson_lambda = t/(max_C*4);
    t_aux = 0;
end

fontsizevar=30;
for timepoint=1:length(data)
    
    
    subplot(1,2,1)
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
    imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    
    subplot(1,2,2)
    for c=1:4
        h1=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+2),sqrt(data(timepoint,4*(c-1)+3)),'b');hold on; 
        h2=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+4),sqrt(data(timepoint,4*(c-1)+5)),'r'); hold on;
    end
    legend([h1 h2], 'RP', 'DAC')
    set(gca,'FontSize',fontsizevar);
    xlabel('Time (months)','FontWeight','bold');
    ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
    set(h1,'LineStyle',':');
    set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
        'XTick',[0 0.2 0.4 0.6 0.8 1],...
        'FontSize',30,'FontWeight','bold')
    xlim([0 1.05]);
    ylim([0 105]);

    title(strcat('Timepoint: ',num2str(timepoint)))
    drawnow;
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
close all


clear all;
clc;
load('branch.mat')

figure;
hold on;

filename = 'branch_performance.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

cube = creates_cube2D(L);

appearance_ratio = 1/(t/20); % it appears 5 times in mean
record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]


fontsizevar=30;
for timepoint=1:length(data)
    
    
    subplot(1,2,1)
    if (strcmp(tumor_evolution,'branch'))
        if appearance_ratio > rand(1,1)
            c=floor(rand(1,1).*(max_C))+1;
            [cube, record] = grow_branch(cube,timepoint/t,c, record);
        else
            [cube, record] = grow_branch(cube,timepoint/t,0, record);
        end
    end
    imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    
    subplot(1,2,2)
    for c=1:4
        h1=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+2),sqrt(data(timepoint,4*(c-1)+3)),'b');hold on; 
        h2=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+4),sqrt(data(timepoint,4*(c-1)+5)),'r'); hold on;
    end
    legend([h1 h2], 'RP', 'DAC')
    set(gca,'FontSize',fontsizevar);
    xlabel('Time (months)','FontWeight','bold');
    ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
    set(h1,'LineStyle',':');
    set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
        'XTick',[0 0.2 0.4 0.6 0.8 1],...
        'FontSize',30,'FontWeight','bold')
    xlim([0 1.05]);
    ylim([0 105]);

    title(strcat('Timepoint: ',num2str(timepoint)))
    drawnow;
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
close all


clear all;
clc;
load('neutral.mat')

figure;
hold on;

filename = 'neutral_performance.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);

if (strcmp(tumor_evolution,'neutral'))
    appearance_ratio = 1/(t/100); % it appears 50 time in mean
    record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]
end

cube = creates_cube2D(L);




fontsizevar=30;
for timepoint=1:length(data)
    
    
    subplot(1,2,1)
    if (strcmp(tumor_evolution,'neutral'))
        if appearance_ratio > rand(1,1)
                c=floor(rand(1,1).*(max_C))+1;
                [cube, record] = grow_neutral(cube,timepoint/t,c, record);
        else
            [cube, record] = grow_neutral(cube,timepoint/t,0, record);
        end
    end
    imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    
    subplot(1,2,2)
    for c=1:4
        h1=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+2),sqrt(data(timepoint,4*(c-1)+3)),'b');hold on; 
        h2=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+4),sqrt(data(timepoint,4*(c-1)+5)),'r'); hold on;
    end
    legend([h1 h2], 'RP', 'DAC')
    set(gca,'FontSize',fontsizevar);
    xlabel('Time (months)','FontWeight','bold');
    ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
    set(h1,'LineStyle',':');
    set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
        'XTick',[0 0.2 0.4 0.6 0.8 1],...
        'FontSize',30,'FontWeight','bold')
    xlim([0 1.05]);
    ylim([0 105]);

    title(strcat('Timepoint: ',num2str(timepoint)))
    drawnow;
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
close all


clear all;
clc;
load('punctuated.mat')

h_old = figure;
hold on;

filename = 'punctuated_performance.gif';
frame = getframe(1);
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'gif', 'Loopcount',inf);
if (strcmp(tumor_evolution,'punctuated'))
    colors = 2:max_C;
end
cube = creates_cube2D(L);


fontsizevar=30;
for timepoint=1:length(data)
    
    
    subplot(1,2,1)
    if ~isempty(colors) && mod(timepoint,2) && timepoint~=1
        new_color = colors(1);
        colors(1) = [];
        cube = grow_punctuated(cube,new_color);
    else
        cube = grow_punctuated(cube,0);
    end
    imagesc(cube,[0 max_C]);
    title(strcat('Timepoint: ',num2str(timepoint)))
    
    subplot(1,2,2)
    for c=1:4
        h1=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+2),sqrt(data(timepoint,4*(c-1)+3)),'b');hold on; 
        h2=errorbar(data(timepoint,1),data(timepoint,4*(c-1)+4),sqrt(data(timepoint,4*(c-1)+5)),'r'); hold on;
    end
    legend([h1 h2], 'RP', 'DAC')
    set(gca,'FontSize',fontsizevar);
    xlabel('Time (months)','FontWeight','bold');
    ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
    set(h1,'LineStyle',':');
    set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
        'XTick',[0 0.2 0.4 0.6 0.8 1],...
        'FontSize',30,'FontWeight','bold')
    xlim([0 1.05]);
    ylim([0 105]);

    title(strcat('Timepoint: ',num2str(timepoint)))
    drawnow;
    frame = getframe(1);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    imwrite(imind,cm,filename,'gif','WriteMode','append');
end
close all

