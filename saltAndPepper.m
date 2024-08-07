function [ new_img ] = saltAndPepper( img,ps,pp )
[H W L]=size(img);

saltCount=round(ps*H*W);
pepperCount=round(pp*H*W);

for i=1:saltCount
    row=ceil(rand(1, 1)*H);
    column=ceil(rand(1, 1)*W);
    img(row, column)=255;
end

for i=1:pepperCount
    row=ceil(rand(1, 1)*H);
    column=ceil(rand(1, 1)*W);
    img(row, column)=0;
end
new_img=img;


end

