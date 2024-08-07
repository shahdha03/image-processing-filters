function [ array ] = histogramFunc( img )
[H W L]=size(img); % L is the channels of the image
if L == 3 %RGB
    R_array = zeros(256, 1);
    G_array = zeros(256, 1);
    B_array = zeros(256, 1);
    for i=1:H
        for j=1:W
            R_array(img(i,j,1)+1)=R_array(img(i,j,1)+1)+1;
            G_array(img(i,j,2)+1)=G_array(img(i,j,2)+1)+1;
            B_array(img(i,j,3)+1)=B_array(img(i,j,3)+1)+1;
        end
    end
    
    array = [R_array, G_array, B_array];
    
else %GRAY
    array = zeros(256, 1);
    for i = 1:H
        for j =1:W    
            array(img(i,j)+1)=array(img(i,j)+1)+1;
        end
    end
    

end

