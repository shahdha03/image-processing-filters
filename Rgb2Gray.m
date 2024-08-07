
function [gray] = Rgb2Gray(RGB, option)
    % Function to convert RGB image to grayscale
    % ignore ~ particular output 
    [H, W, ~] = size(RGB);
    gray = zeros(H, W);
    gray = double(gray);

    for i = 1:H
        for j = 1:W
            if option == 1 
                gray(i, j) = (RGB(i, j, 1) + RGB(i, j, 2) + RGB(i, j, 3)) / 3;
            elseif option == 2 
                gray(i, j) = RGB(i, j, 1) * 0.7 + RGB(i, j, 2) * 0.1 + RGB(i, j, 3) * 0.2;
            elseif option == 3
                gray(i, j) = RGB(i, j, 1);
            elseif option == 4
                gray(i, j) = RGB(i, j, 2);
            elseif option == 5
                gray(i, j) = RGB(i, j, 3);
            end
        end
    end
    gray = uint8(gray);
end

