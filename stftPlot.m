function[ax, h] = stftPlot(stft_coefs,w,overlap,fs,plot_title)

% Input:
%   1) stft_coefs - matrix produced with the stft function (single-sided)
%   2) w - window size that was used in the stft function (for the time
%       axis)
%   3) overlap - percentage of window overlap that was used in the stft 
%       function (for the time axis)
%   4) fs - sampling frequency
%   5) plot_title - a plot title 
%
% Output: 
%   Amplitude spectrogram in color scale
%   1) ax - axis handle
%   2) h - colorbar

% Remove of the n/2+1 bin (Nyquist frequency): 
stftPlot_coefs = stft_coefs(1:end-1,:);

% Energy:
stftPlot_coefs = abs(stftPlot_coefs/w); 
stftPlot_coefs = 20*log10(stftPlot_coefs);

hop = hopSize(w,overlap); 
[rows,columns] = size(stftPlot_coefs);
X = (((1:columns)-1)*hop+w/2)/fs; % time, segment index to seconds (columns)
Y = fs*(0:rows-1)/((rows-1)*2); % frequency, index to Hz) (rows)

handle = pcolor(X,Y,stftPlot_coefs);
set(handle, 'EdgeColor', 'none');
c_bound_lower = -160;
c_bound_higher = 0;
caxis([c_bound_lower c_bound_higher]) 
shading flat
colormap(hot)
h = colorbar;
ylabel(h, 'Energy, dB below 1', 'FontSize', 9)
title(plot_title, 'FontSize', 9)
xlabel('Time, s', 'FontSize', 9)
ylabel('Frequency, Hz', 'FontSize', 9)
set(gca,'fontsize', 9)

ax = gca;

disp(['stftPlot: values lower than ' int2str(c_bound_lower) 'dB and above ' ...
    int2str(c_bound_higher) ' dB are assigned the same color as ' ...
    int2str(c_bound_lower) ' dB and ' int2str(c_bound_higher) ...
    ' dB respectively'])