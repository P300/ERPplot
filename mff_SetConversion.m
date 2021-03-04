eeglab;
mff_BaseDir = 'Place MFF Base Input Directory Here';
set_OutputDir = 'Place Set Output Directory Here';
if ~isfolder(set_OutputDir) || ~isfolder(mff_BaseDir)
    error("Input or Output directory does not exist.\n");
end
files = dir(mff_BaseDir);
filenames = {files.name};
mff_Folders = filenames([files.isdir]);
clear files filenames
mff_Folders = {mff_Folders{3:end}};
mff_Datasets = cell(1,length(mff_Folders));
for i=1:length(mff_Datasets)
    mff_Datasets{i}=pop_mffimport(fullfile(mff_BaseDir,mff_Folders{i}),'code');
    if ~exist(fullfile(set_OutputDir,[mff_Folders{i},'.set']),'file')
        pop_saveset(mff_Datasets{i},'filename',[mff_Folders{i},'.set'],'filepath',fullfile(set_OutputDir));
    end
end
clear mff_BaseDir mff_Folders mff_Datasets
close('gcf')
fprintf('Done.\n')