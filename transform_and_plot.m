function [ax, h] = transform_and_plot(x, w, overlap, fs, plot_title)
%TRANSFORM_AND_PLOT
%
% Input: 
%   1) x - time domain signal to be transformed
%   2) w - window size in samples
%   3) overlap - percentage of window overlap
%   4) fs - sampling frequency
%   5) plot_title - a plot title 
%
% Output: 
%   Amplitude spectrogram in color scale
%   1) ax - axis handle
%   2) h - colorbar
%
paramsSTFT.w = w;
paramsSTFT.overlap = overlap;
x = zeroPadMatrix(x, paramsSTFT);

[stft_single, ~] = stft(x, w, paramsSTFT.overlap);
[ax, h] = stftPlot(stft_single, ...
                   paramsSTFT.w, ...
                   paramsSTFT.overlap, ...
                   fs, ...
                   plot_title);
end

