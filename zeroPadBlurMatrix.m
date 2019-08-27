function[Z] = zeroPadBlurMatrix(X,paramsSTFT)

% Input: 
%   1) X - a matrix of signals to be processed
%   2) w - window size that will be used in stft function
%   3) overlap - percentage of overlap that will be used in stft function
%
% Output:
%   1) Z - zero padded signals so that smearing due to overlap is not lost
%       (input to the stft function)

[L,R] = size(X);

Z = zeros(2*ceil(paramsSTFT.w*paramsSTFT.overlap/100) + L, R); 
for i=1:R
    Z(:,i) = zeroPadBlur(X(:,i),paramsSTFT.w,paramsSTFT.overlap); 
end