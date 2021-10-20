function data = load_signals(dirs)
    
    audio_file_paths = struct();
    for s=1:length(dirs) % loop through week contributor
        [con_aud_folder, ~] = get_path(dirs(s));
        
        for c=1:length(con_aud_folder) % loop through contributors
            [con_aud_files, con_file_name] = get_path(con_aud_folder(c));
            
            con_audio_file_paths = {};
            for a=1:length(con_aud_files) % loop through contributor audio files
               file_path = con_aud_files(a).folder;
               file_name = con_aud_files(a).name;
               
               
               full_path = fullfile(file_path, file_name);
               con_audio_file_paths{end + 1} = full_path;
            end
%             k = split(con_file_name, "_"); k = k{1};
            audio_file_paths.(con_file_name) = con_audio_file_paths;
        end
    end
    
    data = audio_file_paths;
