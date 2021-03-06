function res = eval_con(con_files)
   con_res = {};
   
   for j=1:numel(con_files)
       fpath = con_files{j};
       
       [~, fname, ~] = fileparts(fpath);
       t = strsplit(fname, "_");
       
       stim = t{end - 2};
       
       count  = spot_freq(fpath, false);
       
       
       con_res.(stim) = count;
       disp(fpath);
   end
   
   res = con_res;