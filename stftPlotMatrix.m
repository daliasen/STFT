function[h_gcf] = stftPlotMatrix(stfts,paramsSTFT,fs,plot_title)

% Input:
%   1) stft - matrix produced with the stft function (single-sided)
%   2) paramsSTFT.w - window size that was used in the stft function (for 
%       the time axis)
%   3) paramsSTFT.overlap - percentage of window overlap that was used in 
%       the stft function (for the time axis)
%   4) fs - sampling frequency
%   5) plot_title - title of the plot in single quotes
%
% Output: 
%   Amplitude spectrogram in color scale
%   1) h_gcf - gcf handle

[~, ~, R] = size(stfts);
if R > 6 
    R = 6;
    warning('only the first 6 signals will be plotted')
end

for i=1:R-1
        subplot(R,1,i)
        [ax, h] = stftPlot(stfts(:,:,i),paramsSTFT.w,paramsSTFT.overlap,fs,[plot_title, ' ', num2str(i)]);
        ax.YLabel.String = '';
        ax.XLabel.String = '';
        ax.XTickLabel = '';
        ylabel(h, '');
end
subplot(R,1,R)
stftPlot(stfts(:,:,R),paramsSTFT.w,paramsSTFT.overlap,fs,[plot_title, ' ', num2str(R)]);

h_gcf = gcf;