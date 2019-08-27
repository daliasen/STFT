function[zero_padded] = zeroPad(x,w,overlap)

% Input: 
%   1) x - time domain signal to be processed
%   2) w - window size that will be used in the stft function
%   3) overlap - percentage of window overlap that will be used in the
%       stft function
%
% Output:
%   1) zero padded signal (input to the stft function) so that it 
%       divides by (signal length - window size)/hop size 

N = length(x);
hop = hopSize(w,overlap); 

whole = ceil((N - w)/hop);
Z = whole*hop + w - N;

zerosPad = zeros(Z,1);
zero_padded = [x', zerosPad']';