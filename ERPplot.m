%? how to add lable after using xaxis off
%read files
% *** needs edit
A=dlmread('error.txt');
B=dlmread('correct.txt');
ChanA=A(:,[6 7 8])%selected channels/montage ***
ChanB=B(:,[6 7 8])
MA=mean(ChanA,2)% average selected channels/montage 
MB=mean(ChanB,2)
xvalue=[-196:4:600]%x axis range: time window ***
xvalue1=xvalue'; %transpose
cc=[xvalue1 MA(:,:) MB(:,:)]% combine all columns into one file

%ploting
set(gca, 'box', 'off')
hold on
plot(cc(:,1),cc(:,2),'--b','LineWidth',2)%condintion1
plot(cc(:,1),cc(:,3),'b','LineWidth',2)%condintion2
h = gca; h.XAxis.Visible = 'off';%remove xaxis and label
% set(gca,'Visible','off')
drawaxis(gca, 'x', 0, 'movelabel', 1)
drawaxis(gca, 'y', 0, 'movelabel', 1)
% plot(xvalue1,cc(:,63),'kd')
title('My Title')
xlabel('ms') 
ylabel('µV')

legend ({'correct','error'},'Location','northeast')
ax = gca;
% ax.XColor = 'red'%xasis color
ax.FontSize = 15;
% figure background color to blue
% fig = gcf;
% fig.Color = [[0 0.6 0.8]];

%subplot
% subplot(2,1,1)
% plot(x,y1,'--r','LineWidth',2)
% subplot(2,1,2)
% plot(x,y2,'b','LineWidth',2)

% b     blue
% g     green
% r     red
% c     cyan
% m     magenta
% y     yellow
% k     black
% w     white
