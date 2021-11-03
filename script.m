addpath fx/ vad/
root_data_path = "/home/matlab/Documents/MATLAB/matVad/asquire_data/week_data/";
result_folder_path = "/home/matlab/Documents/MATLAB/matVad/asquire_data/results/results.xml";

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

disp(results);
writestruct(results, result_folder_path);




