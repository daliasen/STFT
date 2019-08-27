function[stft_single, stft_double] = stft(x,w,overlap)

% Input: 
%   1) x - time domain signal to be transformed
%   2) w - window size in samples
%   3) overlap - percentage of window overlap
%
% Output:
%   1) stft_single - single sided short-time spectra 
%   2) stft_double - double sided short-time spectra
%   (rows - frequency bins, columns - time segments)

N = length(x);
hop = hopSize(w,overlap); 
window = hamming(w,'periodic'); 
stft_double = zeros(w,(N-w)/hop+1); % [spectra,time segments] 
count = 1;

for n = 1:hop:N-w+1
    segment = x(n:n+w-1); % take segment of length of window_size
    segment = (segment.*window)/1.08; % apply window & scale down
    stft_double(:,count) = fft(segment); 
    count = count + 1;
end

stft_single = stft_double(1:w/2+1,:); % +1 to keep window_size/2+1 bin