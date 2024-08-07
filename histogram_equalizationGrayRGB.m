function [equalized_img] = histogram_equalizationGrayRGB(img)
% Histogram Equalization Function for RGB Images

[H, W, L] = size(img);
equalized_img = zeros(H, W, L);
equalized_img = double(equalized_img);

if L == 3
    % Separate the RGB channels
    R = img(:, :, 1);
    G = img(:, :, 2);
    B = img(:, :, 3);

    % Calculate the cumulative distribution function (CDF) for each channel
    cdf_R = cumsum(imhist(R)) / (H * W);
    cdf_G = cumsum(imhist(G)) / (H * W);
    cdf_B = cumsum(imhist(B)) / (H * W);

    % Map each channel to the new range [0, 255]
    equalized_R = round(cdf_R(sub2ind(size(R), double(R) + 1)) * 255);
    equalized_G = round(cdf_G(sub2ind(size(G), double(G) + 1)) * 255);
    equalized_B = round(cdf_B(sub2ind(size(B), double(B) + 1)) * 255);

    % Combine the equalized channels back into an RGB image
    equalized_img(:, :, 1) = equalized_R;
    equalized_img(:, :, 2) = equalized_G;
    equalized_img(:, :, 3) = equalized_B;
    
elseif L == 1
    hist_data = imhist(img);
    cdf = cumsum(hist_data) / (H * W);

    for i = 1:H
        for j = 1:W
            for k = 1:L
                equalized_img(i, j, k) = round((cdf(img(i, j, k) + 1)) * 255);
            end
        end
    end
    
end

equalized_img = uint8(equalized_img);

% Display the equalized image and its histogram
%figure;
%imshow(equalized_img);
%title('Histogram Equalization Image Result');
    

end
