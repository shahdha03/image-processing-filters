function [ final_img ] = NonLinear( img,op )
    %op 1 --> min , 2 --> median ,3 --> midpoint ,4 --> max
    rm=3;cm=3;
    [r, c,l] = size(img);
    paddSr = floor(rm/2);
    paddsc = floor(cm/2);
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
            index = 1;
            non_f = zeros(1, rm*cm);non_f1 = zeros(1, rm*cm);
            non_f2 = zeros(1, rm*cm);non_f3 = zeros(1, rm*cm);
            for m = 1 : rm
                for n = 1 : cm
                    if l==1
                        non_f(1,index)=padding((i-paddSr)+m-1,(j-paddsc)+n-1);
                        index=index+1;
                    elseif l==3
                        non_f1(1,index)=padding((i-paddSr)+m-1,(j-paddsc)+n-1,1);
                        non_f2(1,index)=padding((i-paddSr)+m-1,(j-paddsc)+n-1,2);
                        non_f3(1,index)=padding((i-paddSr)+m-1,(j-paddsc)+n-1,3);
                        index=index+1;
                    end
                end
            end
           
            if l==1
                non_f=sort(non_f);
                if op==1
                    final_img(i-paddSr,j-paddsc,1)=non_f(1);
                elseif op==2
                    final_img(i-paddSr,j-paddsc,1)=non_f(uint8((rm*cm)/2));
                elseif op==3
                    vmn=non_f(1);
                    vmx=non_f(rm*cm);
                    final_img(i-paddSr,j-paddsc,1)=uint8((vmn+vmx)/2);
                elseif op==4
                    final_img(i-paddSr,j-paddsc,1)=non_f(rm*cm);
                end
            elseif l==3
                non_f1=sort(non_f1);
                non_f2=sort(non_f2);
                non_f3=sort(non_f3);
                 if op==1
                    final_img(i-paddSr,j-paddsc,1)=non_f1(1);
                    final_img(i-paddSr,j-paddsc,2)=non_f2(1);
                    final_img(i-paddSr,j-paddsc,3)=non_f3(1);
                elseif op==2
                    final_img(i-paddSr,j-paddsc,1)=non_f1(uint8((rm*cm)/2));
                    final_img(i-paddSr,j-paddsc,2)=non_f2(uint8((rm*cm)/2));
                    final_img(i-paddSr,j-paddsc,3)=non_f3(uint8((rm*cm)/2));
                elseif op==3
                    vmn1=non_f1(1);vmn2=non_f2(1);vmn3=non_f3(1);
                    vmx1=non_f1(rm*cm);vmx2=non_f2(rm*cm);vmx3=non_f3(rm*cm);
                    final_img(i-paddSr,j-paddsc,1)=uint8((vmn1+vmx1)/2);
                    final_img(i-paddSr,j-paddsc,2)=uint8((vmn2+vmx2)/2);
                    final_img(i-paddSr,j-paddsc,3)=uint8((vmn3+vmx3)/2);
                elseif op==4
                    final_img(i-paddSr,j-paddsc,1)=non_f1(rm*cm);
                    final_img(i-paddSr,j-paddsc,2)=non_f2(rm*cm);
                    final_img(i-paddSr,j-paddsc,3)=non_f3(rm*cm);
                 end
                
            end
        end
    end
    
    final_img=uint8(final_img);
end


