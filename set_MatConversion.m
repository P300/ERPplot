eeglab;
set_BaseDir = 'Place Set Base Input Directory Here';
mat_OutputDir = 'Place Set Output Directory Here';
if ~isfolder(mat_OutputDir) || ~isfolder(set_BaseDir)
    error("Input or Output directory does not exist.\n");
end
files = dir(fullfile(set_BaseDir,'*.set'));
filenames = {files.name};
clear files
set_Datasets = cell(1,length(filenames));
for i=1:length(set_Datasets)
    set_Datasets{i}=pop_loadset('filename',filenames{i},'filepath',set_BaseDir);
    if ~exist(fullfile(mat_OutputDir,[erase(filenames{i},'.set'),'.mat']),'file')
        dataset = set_Datasets{i};
        save(fullfile(mat_OutputDir,[erase(filenames{i},'.set'),'.mat']), '-struct','dataset');
        dataset=[];
    end
end
clear set_BaseDir set_Datasets
close('gcf')
fprintf('Done.\n')