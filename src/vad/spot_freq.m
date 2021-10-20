function score = spot_freq(audio_fpath, skip_plot)

    engwinp = 0.9;
    thrp = 0.3;
    
    % input
    [sig, fs] = audioread(audio_fpath);
    t = (1:length(sig)) / fs;
    
    % get spectral power: fft
    n = length(t);
    f = fft(sig, n);
    PSD = f .* conj(f) / n;
    freq = fs / n * (0:n);
    L = 1:floor(n / 2);
    
    PSD = PSD(L);
    freq = freq(L);
    
    % get max freq component
    [~, i] = max(PSD);
    fms = freq(i);
    
    % calc frequency range - range: start, end
    offset = 55; % spread around max freq
    if (fms - offset > 0)
        range.start = fms - offset;
    else
        range.start = fms + 5;
    end
    range.end = fms + offset;
    
    
    [b, a] = cheby2(4,40, [range.start range.end] / (fs / 2), 'bandpass');
    f_sig = filtfilt(b, a, sig); % filtered signal
    
    % Compute energy
    N = round(engwinp*fs);
    n_frames = floor(length(f_sig)/N);
    T = zeros(n_frames, 1);
    st_eng = zeros(n_frames, 1);
    for i = 0:n_frames-1
        idx_frame = i*N+1:(i+1)*N;
        frame = f_sig(idx_frame);
        st_eng(i+1) = mean(abs(frame).*2);
        T(i+1) = idx_frame(N/2)/fs;
    end
    
    % Detect segments
    th_range = 0.1:0.01:thrp;
    count = zeros(length(th_range), 1);
    i = 1;
    for thp = th_range
        thr = thp * max(st_eng);
        temp = sign(st_eng - thr);
        temp1 = temp(1:end-1).*temp(2:end);
        count(i) = ceil(length(find(temp1 < 0))/2);
        i = i + 1;
    end

    count = mode(count, "all");
    
    score = count;

    if (skip_plot)
       return 
    end
    
    t = (1:length(sig))/fs;
    th = thrp * max(st_eng);
    nor_st_eng = st_eng/max(st_eng)*max(f_sig);

    figure;
    
    subplot(211); % input signal
    show_wav(audio_fpath);

    subplot(212); % filtered signal + energy + threshold
    hold on;
    plot(t,f_sig);
    plot(T,nor_st_eng,'g');
    plot([T(1) T(end)],[1 1]*th,'k');
    xlabel("count: " + count);
    legend("filtered signal","signal energy","threshold");
    hold off;
 
    
    
    