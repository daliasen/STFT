function[Z] = stftMatrix(X,paramsSTFT)

% Input: 
%   1) X - a matrix of time domain signals to be transformed
%   2) w - window size that will be used in the stft function
%   3) overlap - a percentage of window overlap that will be used in the 
%       stft function
%
% Output:
%   1) Z - a 3D tensor containing STFTs (single-sided)

if ~isempty(X)
    [TF_1, ~] = stft(X(:,1),paramsSTFT.w,paramsSTFT.overlap); % take single sided only
    [~,R] = size(X); % length x number of sources
    [M,T] = size(TF_1); % M - freq bins, T - convolution depth
    Z = zeros(M,T,R);
    Z(:,:,1) = TF_1;
    for i=2:R
        [Z(:,:,i), ~] = stft(X(:,i),paramsSTFT.w,paramsSTFT.overlap); 
    end
else
    Z = [];
    warning('an empty matrix was supplied')
end