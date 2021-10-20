function dirs = list_files(root_path)
    f = dir(root_path);
    f(1:2)=[];
    
    dirs = f;
    