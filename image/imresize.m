function [ img_resize ] = imresize( img_array, varargin )
%IMRESIZE Resize given image.
%   IMG_RESIZE = IMRESIZE( IMG_ARRAY, ... )
%   argsin:
%       img_array       original image matrix.
%       [times]         scale image times of original.
%       [flag, side]    flag 'W', 'H', 'M' and 'S' means to resizing width or 
%                       height to side and equal proportion zoom another 
%                       side or set both width and height equal to side.
%       [w, h]          scale image to size of w x h.
% 
%   argsout:
%       img_resize      return resize image matrix.

argin_length = length(varargin);
if argin_length > 0
    img_size = size(img_array);
    if argin_length == 1
        if length(varargin{1}) == 1
            nw = img_size(2) * varargin{1};
            nh = img_size(1) * varargin{1};
        elseif isnumeric(varargin{1}(1)) && isnumeric(varargin{1}(2))
            nw = varargin{1}(1);
            nh = varargin{1}(2);
        else
            error('arguments formate error !');
        end
    elseif argin_length == 2
        if ischar(varargin{1}) && isnumeric(varargin{2})
            switch(upper(varargin{1}))
                case 'W'
                    nw = varargin{2};
                    nh = (nw / img_size(2))*img_size(1);
                case 'H'
                    nh = varargin{2};
                    nw = (nh / img_size(1))*img_size(2);
                case 'S'
                    nw = varargin{2};
                    nh = varargin{2};
                case 'M'
                    if img_size(2)>img_size(1)
                        nw = varargin{2};
                        nh = (nw / img_size(2))*img_size(1);
                    else
                        nh = varargin{2};
                        nw = (nh / img_size(1))*img_size(2);
                    end
                otherwise
                    nw = varargin{2};
                    nh = (nw / img_size(2))*img_size(1);
                    warning('Warning: side flag error, default to width.')
            end
        elseif isnumeric(varargin{1}) && isnumeric(varargin{2})
            nw = varargin{1};
            nh = varargin{2};
        else
            error('arguments formate error !');
        end
    else
        error('too many arguments !');
    end
    img_resize = img_array(uint32(linspace(1,img_size(1), nh)), uint32(linspace(1,img_size(2), nw)), :);
else
    error('Please input size arguments !');
end
end

