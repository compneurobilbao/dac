load('linear.mat')
figure;
fontsizevar=30;
for c=1
    h1=errorbar(data(:,1),data(:,4*(c-1)+2),sqrt(data(:,4*(c-1)+3)),'b');hold on; 
    h2=errorbar(data(:,1),data(:,4*(c-1)+4),sqrt(data(:,4*(c-1)+5)),'r'); hold on;
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
print('linear_fig1','-deps')

load('branch.mat')
figure;
fontsizevar=15;
for c=3
    h1=errorbar(data(:,1),data(:,4*(c-1)+2),sqrt(data(:,4*(c-1)+3)),'b');hold on; 
    h2=errorbar(data(:,1),data(:,4*(c-1)+4),sqrt(data(:,4*(c-1)+5)),'r'); hold on;
end
legend([h1 h2], 'RP', 'DAC')
set(gca,'FontSize',fontsizevar);
xlabel('Time (months)','FontWeight','bold');
ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
set(h1,'LineStyle',':');
set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
    'XTick',[0 0.2 0.4 0.6 0.8 1],...
    'FontSize',30,'FontWeight','bold')
xlim(axes1,[0 1.05]);
ylim(axes1,[0 105]);
print('branch_fig1','-deps')


load('neutral.mat')
figure;
fontsizevar=15;
for c=3
    h1=errorbar(data(:,1),data(:,4*(c-1)+2),sqrt(data(:,4*(c-1)+3)),'b');hold on; 
    h2=errorbar(data(:,1),data(:,4*(c-1)+4),sqrt(data(:,4*(c-1)+5)),'r'); hold on;
end
legend([h1 h2], 'RP', 'DAC')
set(gca,'FontSize',fontsizevar);
xlabel('Time (months)','FontWeight','bold');
ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
set(h1,'LineStyle',':');
set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
    'XTick',[0 0.2 0.4 0.6 0.8 1],...
    'FontSize',30,'FontWeight','bold')
xlim(axes1,[0 1.05]);
ylim(axes1,[0 105]);
print('neutral_fig1','-deps')



load('punctuated.mat')
figure;
fontsizevar=30;
for c=3
    h1=errorbar(data(:,1),data(:,4*(c-1)+2),sqrt(data(:,4*(c-1)+3)),'b');hold on; 
    h2=errorbar(data(:,1),data(:,4*(c-1)+4),sqrt(data(:,4*(c-1)+5)),'r'); hold on;
end
legend([h1 h2], 'RP', 'DAC')
set(gca,'FontSize',fontsizevar);
xlabel('Time (months)','FontWeight','bold');
ylabel('Percentage of ITH detection (mean \pm error)','FontWeight','bold');
set(h1,'LineStyle',':');
set(gca,'XTickLabel',{'0','20','40','60','80','100'},...
    'XTick',[0 0.2 0.4 0.6 0.8 1],...
    'FontSize',30,'FontWeight','bold')
xlim(axes1,[0 1.05]);
ylim(axes1,[0 105]);
print('punctuated_fig1','-deps')
