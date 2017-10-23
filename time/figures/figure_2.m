clear all;
clc;
addpath('../');

clear all;
clc;

load('linear.mat')

for c=1:4
    rp_mean(:,c) = data(:,4*(c-1)+2);
    dac_mean(:,c) = data(:,4*(c-1)+4);
    rp_std(:,c) = sqrt(data(:,4*(c-1)+3));
    dac_std(:,c) = sqrt(data(:,4*(c-1)+5));
end

subplot(1,2,1)
hb = bar([rp_mean(10,:)' dac_mean(10,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(10,:); dac_std(10,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(10,:); dac_mean(10,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end

subplot(1,2,2)
hb = bar([rp_mean(90,:)' dac_mean(90,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(90,:); dac_std(90,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(90,:); dac_mean(90,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
ylim([0 120]);
hold off
print('linear_fig2','-depsc')
close all


clear all;
clc;
load('branch.mat')

for c=1:4
    rp_mean(:,c) = data(:,4*(c-1)+2);
    dac_mean(:,c) = data(:,4*(c-1)+4);
    rp_std(:,c) = sqrt(data(:,4*(c-1)+3));
    dac_std(:,c) = sqrt(data(:,4*(c-1)+5));
end

subplot(1,2,1)
hb = bar([rp_mean(10,:)' dac_mean(10,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(10,:); dac_std(10,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(10,:); dac_mean(10,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end

subplot(1,2,2)
hb = bar([rp_mean(90,:)' dac_mean(90,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(90,:); dac_std(90,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(90,:); dac_mean(90,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
ylim([-20 120]);
hold off
print('branch_fig2','-depsc')
close all



clear all;
clc;

load('neutral.mat')

for c=1:4
    rp_mean(:,c) = data(:,4*(c-1)+2);
    dac_mean(:,c) = data(:,4*(c-1)+4);
    rp_std(:,c) = sqrt(data(:,4*(c-1)+3));
    dac_std(:,c) = sqrt(data(:,4*(c-1)+5));
end

subplot(1,2,1)
hb = bar([rp_mean(10,:)' dac_mean(10,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(10,:); dac_std(10,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(10,:); dac_mean(10,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end

subplot(1,2,2)
hb = bar([rp_mean(90,:)' dac_mean(90,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(90,:); dac_std(90,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(90,:); dac_mean(90,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
ylim([0 120]);
hold off
print('neutral_fig2','-depsc')
close all

clear all;
clc;

load('punctuated.mat')

for c=1:4
    rp_mean(:,c) = data(:,4*(c-1)+2);
    dac_mean(:,c) = data(:,4*(c-1)+4);
    rp_std(:,c) = sqrt(data(:,4*(c-1)+3));
    dac_std(:,c) = sqrt(data(:,4*(c-1)+5));
end


subplot(1,2,1)
hb = bar([rp_mean(10,:)' dac_mean(10,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(10,:); dac_std(10,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(10,:); dac_mean(10,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
ylim([0 120]);


subplot(1,2,2)
hb = bar([rp_mean(90,:)' dac_mean(90,:)']);
set(hb(1),'FaceColor','b');
set(hb(2),'FaceColor','r');
legend('rp','dac');
set(gca, 'FontSize',12,'XTick',[1 2 3 4],'XTickLabel', ...
    {'ITH 1','ITH 2','ITH 3','ITH 4'});
ylabel('Mean performance')

errbar = [rp_std(90,:); dac_std(90,:)];   % CREATE ‘errbar’ MATRIX
yd = [rp_mean(90,:); dac_mean(90,:)];
hold on
for k1 = 1:2
    errorbar([1:4]+.15*(k1-2),  yd(k1,:),  errbar(k1,:), '.k', 'LineWidth',2)
end
ylim([0 120]);
hold off
print('punctuated_fig2','-depsc')
close all