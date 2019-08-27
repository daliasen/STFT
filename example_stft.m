function[] = example_stft(filePath) 

% Transform an audio signal into the time-frequency domain and plot its
% spectrogram

% STFT parameters

w = 1024; % window size in samples
overlap = 50; % window overlap percentage

% read audio

[audio,fs] = audioread(filePath);

% transfer to time-frequency domain

audio = zeroPad(audio,w,overlap);
[stft_single, ~] = stft(audio,w,overlap);

% plot the spectrogram

plot_title = 'A spectrogram';
stftPlot(stft_single,w,overlap,fs,plot_title);

