function binary = RGB2Binary(RGB, threshold)% try 80 
    [H, W, ~] = size(RGB);
    binary = zeros(H, W); 
    for i = 1:H
        for j = 1:W
            % Convert RGB to grayscale using the average method
            gray = (RGB(i, j, 1) + RGB(i, j, 2) + RGB(i, j, 3)) / 3;
            % Apply threshold
            if gray < threshold
                binary(i, j) = false;
            else
                binary(i, j) = true;
            end
        end
    end

end
