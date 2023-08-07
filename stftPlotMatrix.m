function h_gcf = stftPlotMatrix(stfts, paramsSTFT, fs, plot_title)

% Input:
%   1) stfts - matrices produced with the stft function (single-sided)
%   2) paramsSTFT - a structure with the following fields:
%       w - window size that was used in the stft function (for
%           the time axis)
%       overlap - percentage of window overlap that was used in
%           the stft function (for the time axis)
%   3) fs - sampling frequency
%   4) plot_title - title of the plot in single quotes
%
% Output: 
%   Amplitude spectrogram in color scale
%   1) h_gcf - gcf handle

[~, ~, R] = size(stfts);

if R > 6
    num_subplots = 6;
    warning('only the first 6 signals will be plotted')
else
    num_subplots = R;
end

for i=1:num_subplots-1
        subplot(num_subplots, 1, i)
        [ax, h] = stftPlot(stfts(:,:,i), ...
                           paramsSTFT.w, ...
                           paramsSTFT.overlap, ...
                           fs, ...
                           [plot_title ' (' num2str(i) ' out of ' num2str(R) ')']);
        ax.YLabel.String = '';
        ax.XLabel.String = '';
        ax.XTickLabel = '';
        ylabel(h, '');
end
subplot(num_subplots, 1, num_subplots)
stftPlot(stfts(:,:,num_subplots), ...
         paramsSTFT.w, ...
         paramsSTFT.overlap, ...
         fs, ...
         [plot_title ' (' num2str(i+1) ' out of ' num2str(R) ')']);

h_gcf = gcf;