function [ img_clip ] = imautoclip( varargin )
%IMAUTOCLIP Get clip image according to argsin automatically.
%   IMG_CLIP = IMAUTOCLIP( IMG_ARRAY, ... )
%   argsin:
%       img_array       original image matrix data.
%       [side]          selectable, set clip rect side. default to be min 
%                       of image side.
%       [mode]          selectable, set clip rect position mode, default to
%                       be 'CC'. All mode consist of two char, the first is
%                       horizontal position, the last is vertical position.
%                       Hor:
%                           L -- LEFT
%                           R -- RIGHT
%                           C -- CENTER
%                       Ver:
%                           T -- TOP
%                           B -- BOTTOM
%                           C -- CENTER
%                       Any mdode is the combination of two char.
argin_length = length(varargin);
if argin_length >= 1
    img_array = varargin{1};
    img_size = size(img_array);
    clip_side = min(img_size(1:2));
    clip_mode = 'CC';
    if argin_length == 2
        if ischar(varargin{2})
            clip_mode = varargin{2};
        else
            clip_side = varargin{2};
        end
    end
    if argin_length == 3
        clip_side = varargin{2};
        clip_mode = varargin{3};
    end
    switch(upper(clip_mode))
        case 'CC'
            clip_x = round((img_size(2) - clip_side)/2)+1;
            clip_y = round((img_size(1) - clip_side)/2)+1;
        case 'CT'
            clip_x = round((img_size(2) - clip_side)/2)+1;
            clip_y = 1;
        case 'CB'
            clip_x = round((img_size(2) - clip_side)/2)+1;
            clip_y = img_size(1) - clip_side + 1;
        case 'LC'
            clip_x = 1;
            clip_y = round((img_size(1) - clip_side)/2)+1;
        case 'RC'
            clip_x = img_size(2) - clip_side + 1;
            clip_y = round((img_size(1) - clip_side)/2)+1;
        otherwise
            clip_x = round((img_size(2) - clip_side)/2)+1;
            clip_y = round((img_size(1) - clip_side)/2)+1;
            disp('warning: clip mode error ! using default mode "CC".');
    end
    img_clip = imclip(img_array, clip_x, clip_y, clip_side, clip_side);
else
    disp('no image_array input !');
end

