clear
str0='C:/Users/xiaoqian/Documents/MATLAB/Extract maximum peak/Flash/';
files = dir(fullfile(str0,'*.txt')) ;    % in folder of txt files
N = length(files) ;   % total number of files  

for i = 1:N
    thisfile = strcat(str0,files(i).name );
    t = importdata(thisfile);
    %for the 1st run
    First2=(t(1:206,:)+t(413:618,:))/2; %get data for the fist 2 letters
    Last2=(t(1237:1442,:)+t(1649:1854,:))/2; %
    save(strcat(str0,files(i).name(1:4),'_fisrtlast.mat' ),'First2','Last2');

% end    
% return
     run=[1:4]%totally 5 five runs
     firstrow=[1 1+1854*run ]
    %  aa=1:length(firstrow)
    for iis = 1 :length(firstrow) %for ii=[1,1855,3709,5563,7417]
        ii = firstrow(iis);
        First2=(t(ii:ii+205,:)+t(ii+412:ii+617,:))/2
        Last2=(t(ii+1236:ii+1441,:)+t(ii+1648:ii+1853,:))/2
        P3first=First2((54:78),:); 
        P3last=Last2((54:78),:);
        %    [max_values,idx]=max(P3(:,9))
        %     out=[P3(idx',1) max_values']


        %     xlswrite(sprintf('peak_%s.xlsx',thisfile(1:end-4)),B);
        [max_values,idx]=max(P3first(:,9))
        out1(iis,:)=[P3first(idx',1) max_values']
        [max_values,idx]=max(P3last(:,9))
        out2(iis,:)=[P3last(idx',1) max_values']
    end
    save(strcat(str0,files(i).name(1:4),'.mat' ),'out1','out2');% using save, have to convert variable B into string

end

clear
str0='C:/Users/xiaoqian/Documents/MATLAB/Extract maximum peak/Flash/';
files = dir(fullfile(str0,'*.mat')) ;    % in folder of txt files
N = length(files) ;   % total number of files  
count=1;
for i = 1:N
    load(strcat(str0,files(i).name ));
    for j=1:size(out1,1)
        results(count,:) = [i out1(j,:) out2(j,:)];
        count = count+1;
    end
end

return
    
%combine .mat files into one file
d=dir('*.mat');
x=[];            % start w/ an empty array
for i=1:length(d)
x=[x; load(d(i).name)];   % read/concatenate into x
end