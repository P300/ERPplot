% plot 8 plots in 4X2
%for Flash, ylim([-4, 3.5]);
%for Face, ylim([-4, 6.5]);
A=dlmread('FL_03Face1st_Bcap.txt');
C=dlmread('FL_03Face2nd_Bcap.txt');
B=dlmread('FL_03Flash1st_Bcap.txt');
D=dlmread('FL_03Flash2nd_Bcap.txt');
h1=subplot(4,2,1)
plot(A(:,1),A(:,5),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,4),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,5),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,4),'--k','LineWidth',1)
ylim([-4, 3.5]);
%title('Fz');
set(gca, 'box', 'off')
title('ALS')
%ylabel({'jan';'feb';'march'},'Rotation',0)
ylabel({'Fz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on


h2=subplot(4,2,3)
plot(A(:,1),A(:,11),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,10),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,11),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,10),'--k','LineWidth',1)
ylim([-4, 3.5]);
set(gca, 'box', 'off')
ylabel({'Cz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on

h3=subplot(4,2,5)
plot(A(:,1),A(:,17),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,16),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,17),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,16),'--k','LineWidth',1)
ylim([-4, 3.5]);
set(gca, 'box', 'off')
ylabel({'Pz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on

h4=subplot(4,2,7)
plot(A(:,1),A(:,17),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,16),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,17),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,16),'--k','LineWidth',1)
ylim([-4, 3.5]);
set(gca, 'box', 'off')
ylabel({'Oz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on

h5=subplot(4,2,2)
plot(B(:,1),B(:,3),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,2),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,3),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,2),'--k','LineWidth',1)
ylim([-4, 3.5]);
%title('Fz');
set(gca, 'box', 'off')
title('HV')
ax = gca;
ax.FontSize = 8; 
hold on

h6=subplot(4,2,4)
plot(B(:,1),B(:,5),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,4),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,5),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,4),'--k','LineWidth',1)
ylim([-4, 3.5]);
set(gca, 'box', 'off')
ax = gca;
ax.FontSize = 8; 
hold on

h7=subplot(4,2,6)
plot(B(:,1),B(:,9),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,8),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,9),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,8),'--k','LineWidth',1)
ylim([-4, 3.5]);
set(gca, 'box', 'off')
ax = gca;
ax.FontSize = 8; 
hold on

subplot(4,2,8)
plot(B(:,1),B(:,17),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,16),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,17),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,16),'--k','LineWidth',1)
ylim([-4, 3.5]);
ax = gca;
ax.FontSize = 8; 
set(gca, 'box', 'off')
hold on

legend ({'Early Target','Early Non-target','Late Target','Late Non-target'},'Location','northeast');
% add one common ylable to multiple subplots
suplabel('Time (ms)','x');%need function suplabel.m
suplabel('Amplitude (µV) ','y');
suptitle('Grand Average ERPs for Early and Late Session for Flash Speller');%above all subplot

%Bcap: 5-Cz, 8-Pz
h2=subplot(2,2,1)
plot(A(:,1),A(:,11),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,10),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,11),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,10),'--k','LineWidth',1)
ylim([-6, 4.5]);
set(gca, 'box', 'off')
ylabel({'Cz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
title('Face speller')
hold on

h3=subplot(2,2,3)
plot(A(:,1),A(:,17),'k','LineWidth',2)
hold on
plot(A(:,1),A(:,16),'--k','LineWidth',2)
hold on
plot(C(:,1),C(:,17),'k','LineWidth',1)
hold on
plot(C(:,1),C(:,16),'--k','LineWidth',1)
ylim([-6, 4.5]);
set(gca, 'box', 'off')
ylabel({'Pz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on

subplot(2,2,2)
plot(B(:,1),B(:,11),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,10),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,11),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,10),'--k','LineWidth',1)
ylim([-4.5, 4.5]);
set(gca, 'box', 'off')
%ylabel({'Cz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
title('Flash speller')
hold on

subplot(2,2,4)
plot(B(:,1),B(:,17),'k','LineWidth',2)
hold on
plot(B(:,1),B(:,16),'--k','LineWidth',2)
hold on
plot(D(:,1),D(:,17),'k','LineWidth',1)
hold on
plot(D(:,1),D(:,16),'--k','LineWidth',1)
ylim([-4.5, 4.5]);
set(gca, 'box', 'off')
%ylabel({'Pz'},'Rotation',0)
ax = gca;
ax.FontSize = 8; 
hold on

legend ({'Early Target','Early Non-target','Late Target','Late Non-target'},'Location','northeast');
% add one common ylable to multiple subplots
suplabel('Time (ms)','x');%need function suplabel.m
suplabel('Amplitude (µV) ','y');
suptitle('Grand Average ERPs of Early and Late Session for An Individual in Late Stage of ALS');%above all subplot
