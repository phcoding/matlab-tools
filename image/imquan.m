function [ img_quan ] = imquan( img_array, range )
%IMQUAN Get quantization image of given original image as given range.
%   IMG_QUAN = IMQUAN( IMG_ARRAY, RANGE ) return quantizated image matrix.
%   argsin:
%       img_array       original image matrix data. Mostly it's gray image.
%       range           range to quantizate.
%   argsout:
%       img_quan        quantizated image matrix data.
if isa(img_array, 'double')
    img_array = uint8(img_array*255);
end
for i = 0:(range-1)
    img_array(img_array >= (i*256/range) & img_array < (i+1)*256/range) = uint8(i*255/(range-1));
img_quan = img_array;
end

