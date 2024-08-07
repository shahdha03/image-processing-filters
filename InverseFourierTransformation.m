function [transformed, inverseTransformed] = InverseFourierTransformation(img)
    % Apply 2D Fourier transform
    c = fft2(img);
    
    % Compute the magnitude spectrum
    ca = abs(c);
    
    % Take the logarithm of the magnitude plus 1 to enhance visualization
    clog = log(1 + ca);
    
    % Normalize the result
    f = mat2gray(clog);
    
    % Shift the zero frequency component to the center
    transformed = fftshift(f);
    
    % Perform the inverse Fourier transform
    inverseTransformed = ifft2(ifftshift(c));
    %inverseTransformed = real(inverseTransformed); % Take the real part
    
    % Normalize the inverse transformed result
    %inverseTransformed = mat2gray(inverseTransformed);
end

