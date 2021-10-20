addpath 'C:\Users\User\Documents\MATLAB\matVAD\src\fx'
addpath 'C:\Users\User\Documents\MATLAB\matVAD\src\vad'
root_data_path = "C:\Users\User\Documents\MATLAB\matVAD\data\subjects_data_weekly\weekly_cp";
anote_folder_path = "C:\Users\User\Documents\MATLAB\matVAD\data\subjects_data_weekly\anote";

close all;
data_folders = list_files(root_data_path);

all_cons_data = load_signals(data_folders);

cons = fieldnames(all_cons_data); % all user ids

results = {};

for i=1:numel(cons)
   
   con_id = cons{i};
   con_files = all_cons_data.(con_id);

   con_res = eval_con(con_files);
   
   results.(con_id) = con_res;
end