function [X_padded, paddingAmountSamples] = zeroPadBlurMatrix(X, paramsSTFT)

% Input: 
%   1) X - a matrix of signals to be processed
%   2) w - window size that will be used in stft function
%   3) overlap - percentage of overlap that will be used in stft function
%
% Output:
%   1) Z - zero padded signals so that smearing due to overlap is not lost
%       (input to the stft function)
%   2) paddingAmountSamples - number of samples padded to each side of the
%       signal

w = paramsSTFT.w;
overlap = paramsSTFT.overlap;

[L, R] = size(X);

paddingAmountSamples = ceil(w * overlap / 100);
X_padded = zeros(2 * paddingAmountSamples + L, R);
for i=1:R
    X_padded(:,i) = vertcat(zeros(paddingAmountSamples, 1), ...
                            X(:,i), ...
                            zeros(paddingAmountSamples, 1));
end