function [new_img] = Gaussian_noise_rgb(img, m, s)
    img = double(img);
    [H, W, L] = size(img);

    for c = 1:L % Loop through color channels
        for i = 1:255
            pixelCount = round(((exp((-(i-m)^2)/(2*s^2)))/(sqrt(2*pi)*s))*H*W);
            for j = 1:pixelCount
                row = ceil(rand(1, 1) * H);
                column = ceil(rand(1, 1) * W);
                img(row, column, c) = img(row, column, c) + i;
            end
        end
    end

    % Normalization
    new_img = zeros(size(img));
    for c = 1:L
        mn = min(min(img(:,:,c)));
        mx = max(max(img(:,:,c)));
        new_img(:,:,c) = ((img(:,:,c) - mn) / (mx - mn)) * 255;
    end

    % Convert to uint8
    new_img = uint8(new_img);
end
