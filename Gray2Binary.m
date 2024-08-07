function [ binary ] = Gray2Binary( gray,threshold )
[H, W, ~]=size(gray);
binary=zeros(H,W);
for i=1:H
    for j=1:W
        if gray(i,j)< threshold 
            binary(i,j)=0;
        end
        if gray(i,j)>= threshold 
            binary(i,j)=1;
        end
    end
end
binary=logical(binary);%convert 0,1 int to true and false logical 
%imshow(binary);
end

