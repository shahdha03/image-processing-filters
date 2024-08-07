function new = negative_tranform(img)
    [H, W, L] = size(img);
    new = zeros(H, W);
        img = im2double(img);

        for i = 1:H
            for j = 1:W
                for k = 1:L
                    new(i, j, k) = 1 - img(i, j, k);
                end
            end
        end
end
