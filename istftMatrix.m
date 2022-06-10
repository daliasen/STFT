function[time_domain] = istftMatrix(stftMatrix,w,overlap)

% Input:
%   1) stftMatrix - a tensor containing matrices produced with the stft 
%       function (single-sided), should be complex
%   2) w - window size that was used in the stft function
%   3) overlap - overlap percentage that was used in the stft function
%
% Output: 
%   1) time_domain - a matrix containing real time domain signals

[R,~,~] = size(stftMatrix);

audio_1 = istft(permute(stftMatrix(1,:,:), [2 3 1]),w,overlap)';
L = length(audio_1);
time_domain = zeros(R,L);

time_domain(1,:) = audio_1;

for r=2:R
    time_domain(r,:) = istft(permute(stftMatrix(r,:,:), [2 3 1]),w,overlap)';
end