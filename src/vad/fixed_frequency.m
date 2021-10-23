function score = fixed_frequency(audio_file_path)
    
    % input
    [sig, fs] = audioread(filename);
    
    score = 0;
