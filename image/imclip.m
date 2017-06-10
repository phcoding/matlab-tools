function [ img_clip ] = imclip( img_array, x, y, w, h )
%IMCLIP Clip image as fiven rect data: x, y, w, h form given image matrix.
%   IMG_CLIP = IMCLIP(IMG_ARRAY, X, Y, W, H) return cliped image matrix.
%   argsin:
%       img_array       image matrix data.
%       x               x position of clip rect at left-top pixel point on image.
%       y               y position of clip rect at left-top pixel point on image.
%       w               width of clip rect.
%       h               height of clip rect.
% 
%   argsout:
%       img_clip        cliped image matrix data.
img_size = size(img_array);
if x < 1
    x = 1;
    disp('Warning: found x less to 1, using 1 as default.');
end
if y < 1
    y = 1;
    disp('Warning: found y less to 1, using 1 as default.');
end
if x+w-1>img_size(2)
    w = img_size(2)+1-x;
    disp('Warning: found right side of rect overflow, auto adjusted to fit image matrix.');
end
if y+h-1>img_size(1)
    h = img_size(1)+1-y;
    disp ('Warning: found left side of rect overflow, auto adjusted to fit image matrix.');
end
img_clip = img_array(y:y+h-1, x:x+w-1, :);
end

