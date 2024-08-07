function [newimage] = Gamma_equation(image, value)

[H, W, L] = size(image);
newimage = zeros(H, W, L);
image = im2double(image);

for i = 1:H
    for j = 1:W
        if L == 3 
            newimage(i, j, 1) = image(i, j, 1)^value;
            newimage(i, j, 2) = image(i, j, 2)^value;
            newimage(i, j, 3) = image(i, j, 3)^value;
        else 
            newimage(i, j, 1) = image(i, j, 1)^value;
        end
    end
end

end
