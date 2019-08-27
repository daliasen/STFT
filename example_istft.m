function[] = example_istft(filePath) 

% Transform an audio input signal to the time-frequency domain and back

% STFT parameters

w = 1024; % window size in samples
overlap = 50; % window overlap percentage

% read audio

[audio_in,fs] = audioread(filePath);

% transfer to time-frequency domain

audio_in = zeroPad(audio_in,w,overlap);
[stft_single, ~] = stft(audio_in,w,overlap);

% back to time domain

[audio_out,~] = istft(stft_single,w,overlap);

% plot 

t = (1:length(audio_in))/fs;

figure()

subplot(2,1,1)
plot(t,audio_in)
title('Input')
ylabel('Amplitude')

subplot(2,1,2)
plot(t,audio_out)
ylabel('Amplitude')
title('Output')
xlabel('Time, s')