function [time_domain,stft_double] = istft(stft,w,overlap)

% Input:
%   1) stft - matrix containing complex values produced with the stft
%       function (single sided), dimensions:
%           frequency bins x time segments
%   2) w - window size that was used in the stft function
%   3) overlap - overlap percentage that was used in the stft function
%
% Output: 
%   1) time_domain - real time domain signal
%   2) stft_double - double sided spectrum

if isreal(stft)
    error('The stft matrix should be complex.')
end

% Allocate memory for double-sided spectrum:
[rows,columns] = size(stft);
stft_double = zeros((rows-1)*2,columns);
stft_double(1:rows,:) = stft; 

% Allocate memory for the other side of spectrum:
stft_otherside_abs = zeros(rows-2,columns); 
stft_otherside_angle = zeros(rows-2,columns); 

% Mirror spectrum from one side to the other (ignore 1st & (windoe_size/2+1)th bins):
for c = 1:1:columns
    for r = 2:1:rows-1
        stft_otherside_abs(rows-r,c) = abs(stft(r,c)); % magnitude
        stft_otherside_angle(rows-r,c) = -angle(stft(r,c)); % negate phase
    end
end
[A,B] = pol2cart(stft_otherside_angle,stft_otherside_abs); % polar to Cartesian
stft_otherside = complex(A,B); % to MATLAB's complex numbers
stft_double(rows+1:end,:) = stft_otherside; % put both sides to one matrix

hop = hopSize(w,overlap); 
N = (columns-1)*hop+w; % number of samples
stft_ifft_overlap = ifft(stft_double); 
stft_ifft = zeros(N,1); % allocate memory for overlap-add

% Overlap-add:
column_count = 1; 
for n = 1:hop:N-w+1
    stft_ifft(n:n+w-1) = stft_ifft(n:n+w-1) + stft_ifft_overlap(:,column_count);
    column_count = column_count + 1;
end

time_domain = real(stft_ifft);