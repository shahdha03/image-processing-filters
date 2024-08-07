function [ outMask ] = LinearFilters( index )
%1--> mean filter
%2--> weighted filter
%3--> point detection ( Laplacian )
%4--> sobel (horzontal)
%5--> sobel (vertical)
%6--> sobel(RD)
%7--> sobel(LD)
%8--> robert(horizontal)
%9--> robert(vetical)
%10--> robert(RD)
%11--> robert(LD)
%12--> point sharpening
%13--> point sharpen (horizontal)
%14--> point sharpen (vertical)
%15--> point sharpen (RD) 
%16--> point sharpen (LD) 


% mean filter
    if index == 1
        mask = 1/25*[
            1 1 1 1 1;
            1 1 1 1 1;
            1 1 1 1 1;
            1 1 1 1 1;
            1 1 1 1 1
            ];
        outMask = mask;
%weight filter
    elseif index == 2
        mask=1/16*[
            1 2 1;
            2 4 2;
            2 0 2
            ];
        outMask = mask;
%point detection
    elseif index == 3
        mask=[
            0 1 0;
            1 -4 1;
            0 1 0
            ];
        outMask = mask;
        %sobel mask
            %horizontal
    elseif index == 4
            mask=[
                1 2 1;
                0 0 0;
                -1 -2 -1
                ];
            outMask = mask;
            %vertical
    elseif index == 5
            mask=[
                1 0 -1;
                2 0 -2;
                1 0 -1
                ];
            outMask = mask;
            %right digonal
    elseif index == 6
            mask=[
                1 0 -1;
                2 0 -2;
                1 0 -1
                ];
            outMask = mask;
            %left digonal
    elseif index == 7
            mask=[
                0 -1 -2;
                1 0 -1;
                2 1 0
                ];
            outMask = mask;
        %robet mask
            %horizontal
    elseif index == 8
            mask=[
                0 1 0;
                0 0 0;
                0 -1 0
                ];
            outMask = mask;
            %vertical
    elseif index == 9
            mask=[
                0 0 0;
                1 0 -1;
                0 0 0
                ];
            outMask = mask;
            %right digonal
    elseif index == 10
            mask=[
                1 0 0;
                0 0 0;
                0 0 -1
                ];
            outMask = mask;
            %left digonal
    elseif index == 11
            mask=[
                0 0 1;
                0 0 0;
                -1 0 0
                ];
            outMask = mask;
%point sharping
    elseif index == 12
            mask=[
                0 1 0;
                1 -3 1;
                0 1 0
                ];
            outMask = mask;
             %horizontal
    elseif index == 13
             mask=[
                 0 1 0;
                 0 1 0;
                 0 -1 0
                 ];
             outMask = mask;
            %vertical
    elseif index == 14
            mask=[
                0 0 0;
                1 1 -1 ;
                0 0 0];
            outMask = mask;
            %right digonal
    elseif index == 15
            mask=[
                0 0 1;
                0 1 0;
                -1 0 0
                ];
            outMask = mask;
            %left digonal
    elseif index == 16
            mask=[
                1 0 0;
                0 1 0;
                0 0 -1
                ];
            outMask = mask;
    end

end

