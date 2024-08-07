function [new_image] = Brightness_Darkness(old_image, offset, option)
    [H, W, L] = size(old_image);
    new_image = zeros(H, W, L);
    old_image = im2double(old_image);
    for i = 1:H
        for j = 1:W
            for k = 1:L
                if (option == 1)
                    new_image(i, j, k) = min(1, old_image(i, j, k) + offset/100);
                elseif (option == 2)
                    new_image(i, j, k) = min(1, old_image(i, j, k) * offset);
                elseif (option == 3)
                    new_image(i, j, k) = max(0, old_image(i, j, k) - offset/100);
                elseif (option == 4)
                    if offset ~= 0
                        new_image(i, j, k) = min(1, old_image(i, j, k) / offset);
                    else
                        new_image(i, j, k) = old_image(i, j, k);
                    end
                end
            end
        end
    end
end
