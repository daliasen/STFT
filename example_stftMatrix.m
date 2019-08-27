function[] = example_stftMatrix(filePath_1,filePath_2)

% Transform audio signals into the time-frequency domain and plot 
% their spectrograms in a single figure

% STFT parameters

params.w = 1024; % window size in samples
params.overlap = 50; % window overlap percentage

% read audio

[audio_1,fs_1] = audioread(filePath_1);
[audio_2,fs_2] = audioread(filePath_2);

if fs_1 ~= fs_2
    error('Sample rates must match')
end

if length(audio_1) ~= length(audio_2)
    error('Lengths of audio files must match')
end

% put into a matrix (must the same length)
audio(:,1) = audio_1;
audio(:,2) = audio_2;

% transfer to time-frequency domain

% zero-pad so that the number of windows is an integer
audio = zeroPadMatrix(audio,params); 
stft_single = stftMatrix(audio,params);

% plot the spectrograms

plot_title = 'Spectrogram';
stftPlotMatrix(stft_single,params,fs,plot_title);