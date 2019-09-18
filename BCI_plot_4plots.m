%? how to add lable after using xaxis off
%read files
% *** needs edit
A=dlmread('ALSflash_1s_6subt.txt');
%B=dlmread('GA_HVflash_5sub1.txt');
C=dlmread('ALSflash_2nd_6sub.txt');

% subplot(2,1,2)
%title('Grand Average ERPs for Flash Speller')
h1=subplot(4,1,1)
plot(A(:,1),A(:,3),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,2),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,3),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,2),'--k','LineWidth',1)
ylim([-3.5, 6.5]);
title('Fz');
set(gca, 'box', 'off')
hold on

h2=subplot(4,1,2)
plot(A(:,1),A(:,5),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,4),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,5),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,4),'--k','LineWidth',1)
ylim([-3.5, 6.5]);
title('Cz');
set(gca, 'box', 'off')
hold on

h3=subplot(4,1,3)
plot(A(:,1),A(:,9),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,8),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,9),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,8),'--k','LineWidth',1)
title('Pz');
ylim([-3.5, 6.5]);
set(gca, 'box', 'off')
hold on

h4=subplot(4,1,4)
plot(A(:,1),A(:,17),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,16),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,17),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,16),'--k','LineWidth',1)
ylim([-3.5, 6.5]);
title('Oz');
set(gca, 'box', 'off')
hold on


legend ({'Early Session_Target','Early Session_Non-target','Late Session_Target','Late Session_Non-target'},'Location','northeast');
% add one common ylable to multiple subplots
suplabel('Time (ms)','x');%need function suplabel.m
suplabel('Amplitude (µV) ','y');
suptitle('Grand Average ERPs for Flash Speller');%above all subplot
% add title and lable to each plot
AxesH    = findobj(FigH, 'Type', 'Axes');
YLabelHC = get(AxesH, 'YLabel');
YLabelH  = [YLabelHC{:}];
set(YLabelH, 'String', 'Y-label')
TitleHC  = get(AxesH, 'Title');
TitleH   = [TitleHC{:}];
set(TitleH, 'String', 'The title');
%change plot font size and axis lable orientation
ylabel({'Fz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
% ax.XColor = 'red'%xasis color

% figure background color to blue
% fig = gcf;
% fig.Color = [[0 0.6 0.8]];

%subplot
% subplot(2,1,1)% (row, column, position)

% plot(x,y2,'b','LineWidth',2)

% b     blue
% g     green
% r     red
% c     cyan
% m     magenta
% y     yellow
% k     black
% w     white

%LOOPing files 
files=dir('*.txt');
%xvalue=[-196:4:600];
for k = 1 : length(files)
    A=load (files(k).name)
    figure(k)
    plot(A(:,1),A(:,3))
    hold on
end