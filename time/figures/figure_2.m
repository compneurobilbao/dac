clear all;
clc;

load('linear.mat')

for c=1:4
    data_rp(:,c) = data(:,4*(c-1)+2);
    data_dac(:,c) = data(:,4*(c-1)+4);
end
rp_mean = mean(data_rp);
dac_mean = mean(data_dac);
rp_std = std(data_rp);
dac_std = std(data_dac);


hb = bar([rp_mean' dac_mean']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel',{'ITH 1','ITH 2','ITH 3','ITH 4' });
ylabel('Mean performance')

errbar = [rp_std; dac_std];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean' dac_mean' ]';
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
hold off
print('linear_fig2','-depsc')
close all




clear all;
clc;

load('branch.mat')

for c=1:4
    data_rp(:,c) = data(:,4*(c-1)+2);
    data_dac(:,c) = data(:,4*(c-1)+4);
end
rp_mean = mean(data_rp);
dac_mean = mean(data_dac);
rp_std = std(data_rp);
dac_std = std(data_dac);


hb = bar([rp_mean' dac_mean']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel',{'ITH 1','ITH 2','ITH 3','ITH 4' });
ylabel('Mean performance')

errbar = [rp_std; dac_std];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean' dac_mean' ]';
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
hold off
print('branch_fig2','-depsc')
close all





clear all;
clc;

load('neutral.mat')

for c=1:4
    data_rp(:,c) = data(:,4*(c-1)+2);
    data_dac(:,c) = data(:,4*(c-1)+4);
end
rp_mean = mean(data_rp);
dac_mean = mean(data_dac);
rp_std = std(data_rp);
dac_std = std(data_dac);


hb = bar([rp_mean' dac_mean']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel',{'ITH 1','ITH 2','ITH 3','ITH 4' });
ylabel('Mean performance')

errbar = [rp_std; dac_std];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean' dac_mean' ]';
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
hold off
print('neutral_fig2','-depsc')
close all

clear all;
clc;

load('punctuated.mat')

for c=1:4
    data_rp(:,c) = data(:,4*(c-1)+2);
    data_dac(:,c) = data(:,4*(c-1)+4);
end
rp_mean = mean(data_rp);
dac_mean = mean(data_dac);
rp_std = std(data_rp);
dac_std = std(data_dac);


hb = bar([rp_mean' dac_mean']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel',{'ITH 1','ITH 2','ITH 3','ITH 4' });
ylabel('Mean performance')

errbar = [rp_std; dac_std];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean' dac_mean' ]';
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
hold off
print('punctuated_fig2','-depsc')
close all