function [ img_sam ] = imsample( img_array, sample_rate )
%IMSAMPLE Smapling from img_array data according to given sample rate.
%   IMG_SAM = IMSAMPLE(IMG_ARRAY, SAMPLE_RATE)
%   argsin:
%       img_array       original image uint8 data. array like row x col x 3(for rgb mode).
%       sample_rate     the interval between two sapmle pixel point.
% 
%   argsout:
%       img_sam         return sampling images matrix.

img_size = size(img_array);
img_sam = img_array(uint32(linspace(1, img_size(1), sample_rate))...
    , uint32(linspace(1, img_size(2), sample_rate)), :);
end

