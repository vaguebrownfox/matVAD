function [path, name] = get_path(dir)
    folder_path = dir.folder;
    folder_name = dir.name;
    full_path = fullfile(folder_path, folder_name);
    
    path = list_files(full_path);
    
    name = folder_name;
    
    