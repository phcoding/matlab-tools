function [ img_area ] = imarea( img_array )
%IMAREA Get area value of an image.
%   argsin:
%       img_array       image matrix.
%   argsout:
%       img_area        return area value of image.

img_size = size(img_array);
img_area = img_size(1) * img_size(2);
end

