function [final_img] = LinearFilter( img, mask)

%{ 
    %Blurring ( averaging )
   mask1 = [
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25;
    1/25 1/25 1/25 1/25 1/25
];
%edge detection
   mask2 =[
    0 0 -1 0 0;
    0 -1 -2 -1 0;
    -1 -2 16 -2 -1;
    0 -1 -2 -1 0;
    0 0 -1 0 0
];

%sharpen
mask3=[
1 0 -1 
1 1 -1
0 0 0
];

%blurring (averaging) weighted
mask=1/16*[
    1 2 1;
    2 4 2;
    2 0 2
    ];



    if index == 1
        mask = mask1;
    elseif index ==2
        mask = mask2;
    elseif index ==3
        mask = mask3;
    end

%}

    [rm, cm] = size(mask);
    [r, c,l] = size(img);
    
    paddSr = floor(rm/2);
    paddsc = floor(cm/2);
    %paddSr =uint8((rm/2)-1);  
    % paddsc=uint8((cm/2)-1);
     padding = zeros(r+(2*paddSr),c + (2*paddsc),l);
    for i=paddSr+1:r +paddSr
        for j=paddsc+1:c +paddsc
            if l==1
                padding(i,j)=img(i-paddSr,j-paddsc);
            elseif l==3
                padding(i,j,1)=img(i-paddSr,j-paddsc,1);
                padding(i,j,2)=img(i-paddSr,j-paddsc,2);
                padding(i,j,3)=img(i-paddSr,j-paddsc,3);
            end
        end
    end
    
    final_img = zeros(r, c,l);
   [rp, cp,l] = size(padding);
   for i=paddSr+1:rp-paddSr
        for j=paddsc+1:cp-paddsc
            sum = 0.0;
            sum1=0.0;sum2=0.0;sum3=0.0;
            for m = 1 : rm
                for n = 1 : cm
                    if l==1
                        sum=sum+(mask(m,n)*padding((i-paddSr)+m-1,(j-paddsc)+n-1));
                    elseif l==3
                        sum1=sum1+(mask(m,n)*padding((i-paddSr)+m-1,(j-paddsc)+n-1,1));
                        sum2=sum2+(mask(m,n)*padding((i-paddSr)+m-1,(j-paddsc)+n-1,2));
                        sum3=sum3+(mask(m,n)*padding((i-paddSr)+m-1,(j-paddsc)+n-1,3));
                    end
                end
            end
            if sum<0
                sum=0;
            elseif sum>255
                sum=255;
            end
            if sum1<0
                sum1=0;
            elseif sum1>255
                sum1=255;
            end
            if sum2<0
                sum2=0;
            elseif sum2>255
                sum2=255;
            end
            if sum3<0
                sum3=0;
            elseif sum3>255
                sum3=255;
            end
            if l==1
                final_img(i-paddSr,j-paddsc,1)=sum;
            elseif l==3
                final_img(i-paddSr,j-paddsc,1)=sum1;
                final_img(i-paddSr,j-paddsc,2)=sum2;
                final_img(i-paddSr,j-paddsc,3)=sum3;
            end
        end
    end
    
    final_img=uint8(final_img);
end