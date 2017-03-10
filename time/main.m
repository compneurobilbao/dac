%
% Divide and conquer (DAC) strategy for tumor sampling
% Jesus M Cortes, Ikerbasque & Biocruces
% March 10, 2016
%
% Figure 2 
%

clear all;
clc;


S=33;        % scale, odd number
L=3*S;      % cube side 
t=100;      % 100, number of timesteps

max_C=4;  % ITH types
max_trials=500;  % 500, for each value of H, we apply separately each strategy N=max_trials and compute mean +- standard deviation
max_tumor_number=15;  % 15, also averaging over different tumors
tumor_evolution='neutral';  %'random' or 'regional'

for tumor_number=1:max_tumor_number
    tumor_number
    str_output_file=strcat('output_heteregeneity_',tumor_evolution,'_tumor',num2str(tumor_number),'.txt');
    output_file=fopen(str_output_file,'w');
    
    cube = creates_cube2D(L);
    
    if (strcmp(tumor_evolution,'linear'))
        colors = 2:max_C;
        poisson_lambda = t/(max_C+1);
        t_aux = 0;
    elseif (strcmp(tumor_evolution,'branch'))
        appearance_ratio = 1/(t/20); % it appears 5 times in mean
        record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]
    elseif (strcmp(tumor_evolution,'neutral'))
        appearance_ratio = 1/(t/100); % it appears 50 times in mean
        record = [floor(L/2) floor(L/2) 1 0]; % record = [x y color growing_step]
    else % 'punctuated'
        colors = 2:max_C;
    end

    
    for timepoint=1:t

        % creates an heteregeneous cube with ITH given by max_H
        % and ITH types  equal to C
        
        if (strcmp(tumor_evolution,'linear'))
            colors = unique(cube);
            if colors(1) == 0
                colors(1) = [];
            end
            if poissrnd(t_aux) > poisson_lambda && ~isempty(colors) && length(colors) < 2
                t_aux = 0;
                new_color = colors(1);
                colors(1) = [];
                cube = grow_linear(cube,new_color);
            else
                t_aux = t_aux + 1;
                cube = grow_linear(cube,0);
            end
        elseif (strcmp(tumor_evolution,'branch'))
            if appearance_ratio > rand(1,1)
                c=floor(rand(1,1).*(max_C))+1;
                [cube, record] = grow_branch(cube,timepoint/t,c, record);
            else
                [cube, record] = grow_branch(cube,timepoint/t,0, record);
            end
        elseif (strcmp(tumor_evolution,'neutral'))
            if appearance_ratio > rand(1,1)
                c=floor(rand(1,1).*(max_C))+1;
                [cube, record] = grow_neutral(cube,timepoint/t,c, record);
            else
                [cube, record] = grow_neutral(cube,timepoint/t,0, record);
            end  
        else % 'punctuated'
            if ~isempty(colors) && mod(timepoint,3)
                new_color = colors(1);
                colors(1) = [];
                cube = grow_punctuated(cube,new_color);
            else
                cube = grow_punctuated(cube,0);
            end
        end
        
        % repeating max_trials times same sampling strategy
        x=zeros(max_trials,2*max_C+1);
        for  trials=1:max_trials
            out_rp=zeros(max_C,1);
            out_dac=zeros(max_C,1);
            % RP strategy
            [success] = RP2D(cube,L,S,max_C);
            
            for c=1:max_C
                if(success(c,1)>0)
                    out_rp(c,1)=1;
                else out_rp(c,1)=0;
                end
            end            
            % DAC strategy
            
            [success] = DAC2D(cube,L,S,max_C);
            for c=1:max_C
                if(success(c,1)>0)
                    out_dac(c,1)=1;
                else out_dac(c,1)=0;
                end
            end
            x(trials,1)=trials;
            
            for c=1:max_C
                x(trials,1+c)=out_rp(c);
                x(trials,1+max_C+c)=out_dac(c);
            end
        end
        fprintf(output_file,'%f  ',timepoint);
        
        for c=1:max_C
            mean_rp=mean(x(:,1+c));
            var_rp=var(x(:,1+c));
            mean_dac=mean(x(:,1+max_C+c));
            var_dac=var(x(:,1+max_C+c));
            fprintf(output_file,'%f  %f  %f  %f  %f  ',mean_rp,var_rp,mean_dac,var_dac);
        end
        fprintf(output_file,'\n');
    end
    fclose(output_file);
end


mean_rp=zeros(t/1,max_C);
var_rp=zeros(t/1,max_C);

mean_dac=zeros(t/1,max_C);
var_dac=zeros(t/1,max_C);

i=0;
for timepoint=1:t
    i=i+1;
    
    rp1=zeros(max_C,1);
    rp2=zeros(max_C,1);
    dac1=zeros(max_C,1);
    dac2=zeros(max_C,1);
    
    for tumor_number=1:max_tumor_number
        str_output_file=strcat('output_heteregeneity_',tumor_evolution,'_tumor',num2str(tumor_number),'.txt');
        x=load(str_output_file);

        for c=1:max_C
            rp1(c,1)=rp1(c,1)+x(i,4*(c-1)+2);
            rp2(c,1)=rp2(c,1)+x(i,4*(c-1)+3);
            dac1(c,1)=dac1(c,1)+x(i,4*(c-1)+4);
            dac2(c,1)=dac2(c,1)+x(i,4*(c-1)+5);
        end
    end
    
    for c=1:max_C
        mean_rp(i,c)=rp1(c,1)/max_tumor_number;
        var_rp(i,c)=rp2(c,1)/(max_tumor_number*max_tumor_number);
        mean_dac(i,c)=dac1(c,1)/max_tumor_number;
        var_dac(i,c)=dac2(c,1)/(max_tumor_number*max_tumor_number);
    end
end


% plotting figures

dim=size(mean_rp,1);
data=zeros(dim,1+4*max_C);
data(:,1)=(1:t)'.*(100./(L*L));  % 2D, percentage of heteregenous density
for c=1:max_C
    data(:,4*(c-1)+2)=mean_rp(:,c).*100;
    data(:,4*(c-1)+3)=var_rp(:,c).*100.*100;
    data(:,4*(c-1)+4)=mean_dac(:,c).*100;
    data(:,4*(c-1)+5)=var_dac(:,c).*100.*100;
end

% plotting data

figure;
fontsizevar=30;

for c=1:max_C
    h1=errorbar(data(:,1),data(:,4*(c-1)+2),sqrt(data(:,4*(c-1)+3)),'b');hold on; h2=errorbar(data(:,1),data(:,4*(c-1)+4),sqrt(data(:,4*(c-1)+5)),'r'); hold on;
end
legend([h1 h2], 'RP', 'DAC')
set(gca,'FontSize',fontsizevar);
xlabel('ITH density (%)');
ylabel('Percentage of ITH detection (mean \pm error)');

figure;
fontsizevar=30;
LineWidth=5;
for c=1:max_C
    plot(data(:,1),data(:,4*(c-1)+2),'b','LineWidth',LineWidth); hold on; plot(data(:,1),data(:,4*(c-1)+4),'r','LineWidth',LineWidth);hold on;
end
legend('RP','DAC');
set(gca,'FontSize',fontsizevar);
xlabel('ITH density (%)');
ylabel('Mean of ITH detection (%)');

figure;
fontsizevar=30;
LineWidth=5;
for c=1:max_C
    plot(data(:,1),sqrt(data(:,4*(c-1)+3)),'b','LineWidth',LineWidth); hold on; plot(data(:,1),sqrt(data(:,4*(c-1)+5)),'r','LineWidth',LineWidth);hold on;
end
legend('RP','DAC');
set(gca,'FontSize',fontsizevar);
xlabel('ITH density (%)');
ylabel('Error of ITH detection (%)');


