function[hop] = hopSize(w,overlap)

% Input: 
%   1) overlap - percentage of window overlap
%   2) w - stft window size
%
% Output: 
%   1) hop - hop size in number of samples

hop = ceil(w*(100-overlap)/100); 