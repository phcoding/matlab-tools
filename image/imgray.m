function [ img_gray ] = imgray( img_array )
%IMGRAY Get gray image of original image.
%   IMG_GRAY = IMGRAY( IMG_ARRAY ) return gray image.
%   argsin:
%       img_array       original image matrix data.
% 
%   argsout:
%       img_gray        gray image matrix data.

img_dim = length(size(img_array));
if img_dim == 3
    img_gray = uint8(single(img_array(:,:,1))*0.229 + single(img_array(:,:,2))*0.587 + single(img_array(:,:,3))*0.114);
else
    img_gray = img_array;
end
end

