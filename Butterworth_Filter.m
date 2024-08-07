function [zz] = Butterworth_Filter(image,D0,index)
[H, W , L]=size(image);
filter =zeros(H,W,L);
for j=1:H 
    for k=1:W 
        dist=sqrt((j-(H/2)).^2+(k-(W/2)).^2);
        filter(j,k)=(1/(1+(dist/D0).^(2)));
    end
end
if(index==0)
    filter = filter;
else
    filter=1-filter;
end

fi = fft2(image); 
fi = fftshift(fi);
reall=real(fi);  
imagin=imag(fi);
nreal=filter.*reall; 
nimagin =filter.*imagin;
NI=nreal(:,:)+i*nimagin(:,:);
NI =fftshift(NI);
NI=ifft2(NI) ;   
zz=mat2gray((abs(NI)));

end