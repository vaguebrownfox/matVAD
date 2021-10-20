
function show_wav(audio_file) 

   anote_folder_path="C:\Users\User\Documents\MATLAB\matVAD\data\subjects_data_weekly\anote";
   [sig, fs] = audioread(audio_file);
   
   [~, fn, ~] = fileparts(audio_file);
   anote_file_path = fullfile(anote_folder_path, fn + ".txt");
   file_id = fopen(anote_file_path);
   anotes = textscan(file_id,'%f\t%f\t%s' );
   
   t_start = floor(anotes{1, 1} * fs);
   t_end = floor(anotes{1, 2} * fs);
%    labels = anotes{1, 3};

   t = (1:length(sig)) / fs;
   a_start = zeros(1, length(sig)); a_start(t_start) = 1;
   a_end = zeros(1, length(sig)); a_end(t_end) = 0.7;
   
   hold on;
   plot(t, sig, 'k');
   plot(t, a_start, 'blue');
   plot(t, a_end, "red");
   legend("signal", "start", "end")
   title(strrep(fn, "_", " "))
   hold off;