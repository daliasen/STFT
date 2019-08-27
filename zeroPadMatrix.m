function[Z] = zeroPadMatrix(X,paramsSTFT)

% Input: 
%   1) X - a matrix of the time domain signals to be processed
%   2) w - window size that will be used in stft function
%   3) overlap - percentage of window overlap that will be used in the
%       stft function
%
% Output:
%   1) zero padded signals so that their length divides by
%       (signal length - window size)/hop size
%       (input to the stft function)

[L,R] = size(X);

Z = zeros(ceil((L - paramsSTFT.w)/hopSize(paramsSTFT.w,paramsSTFT.overlap))*hopSize(paramsSTFT.w,paramsSTFT.overlap) + paramsSTFT.w, R); 
for i=1:R
    Z(:,i) = zeroPad(X(:,i),paramsSTFT.w,paramsSTFT.overlap); 
end