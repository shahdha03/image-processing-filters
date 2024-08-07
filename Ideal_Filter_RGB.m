function [result] = Ideal_Filter_RGB(image, D0, index)
    [H, W, L] = size(image);
    result = zeros(H, W, L);

    if L == 1
        result = Ideal_Filter(image, D0, index);
    else
        a = Ideal_Filter(image(:,:,1), D0, index);
        b = Ideal_Filter(image(:,:,2), D0, index);
        c = Ideal_Filter(image(:,:,3), D0, index);
        result = cat(3, a, b, c);
    end

    result = im2uint8(result);
end