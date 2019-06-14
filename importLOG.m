% '/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG'
clear
clc


Files = dir(strcat('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG/','*.log'));
lengthFiles = length(Files);

%for i=1:lengthFiles
  %filename = Files(i).name;
  %idx=strfind(filename,'_');
  %name2 = strcat(filename(1:idx(2)),'fil_seg');
 %nextpath = strcat('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG2/',name2,'.txt');
 %needtocopy = strcat('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG/',filename);
 % copyfile(needtocopy,nextpath);

%end

%data  = readtable('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG2/001_BL_20170313_012920_fil_seg.txt');
%data = table2dataset(data);

Files2 = dir(strcat('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG2/','*.txt'));
lengthFiles2 = length(Files2);

for ff = 1:lengthFiles2
    ff
    try
        filename = Files2(ff).name;
        idx=strfind(filename,'_');
        name{ff} = filename(1:idx(2)-1);
        path = strcat('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG2/',filename);
        data = readtable(path);
        category = data(:,1);
        segmentgood = data(:,3);

        record = zeros(size(category,1),3);


        for i=1:size(category,1)
            try
                tt = category(i,1).Category{1};
            catch
                tt = category(i,1).Var1{1};
            end
        if strcmp(tt,'correct')

                record(i,1)=1;
        elseif strcmp(tt,'error')

                record(i,2)=1;
        elseif strcmp(tt,'slow')

                record(i,3)=1;
        end

        end


        segment = zeros(size(segmentgood,1),2);


        for i=1:size(category,1)
            try
                tt = segmentgood(i,1).SegmentGood{1};
            catch

                tt = segmentgood(i,1).Var3{1};
            end

            if strcmp(tt,'true')

                    segment(i,1)=1;
            elseif strcmp(tt,'false')

                    segment(i,2)=1;

            end

        end

        CorrectTrue = 0;
        SlowTrue=0;
        ErrorTure=0;

        for i=1:size(category,1)
          if record(i,1)==1&segment(i,1)==1
              CorrectTrue=CorrectTrue+1;
          elseif record(i,2)==1&segment(i,1)==1

                ErrorTure=ErrorTure+1;
          elseif record(i,3)==1&segment(i,1)==1
                SlowTrue=SlowTrue+1;
          end

        end

        result(ff,1:3) = [CorrectTrue ErrorTure SlowTrue];

        result2(ff,1:3) = [sum(record)];
    end
end
results = {};
results2={};
for i=1:lengthFiles2

  results {i,1} = name{i};
  results {i,2} = result(i,1);
  results {i,3} = result(i,2);
  results {i,4} = result(i,3);
  results2 {i,1} = name{i};
  results2 {i,2} = result2(i,1);
  results2 {i,3} = result2(i,2);
  results2 {i,4} = result2(i,3);

end

xlswrite('/Users/analymini/Desktop/XY/2017S ED/100_500SEG/LOG2/results.xls',results,'results');