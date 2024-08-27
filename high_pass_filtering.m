clear;
I = imread('tire.tif');

% Calculate the DFT
I_fft = fft2(double(I));

% Rearrange the Fourier transform by shifting the zero-frequency component to the center of the array
I_shifted = fftshift(I_fft);

% Get the size of the original image
[m, n] = size(I);

% High-pass filter
[x, y] = meshgrid(1:n, 1:m);
z = sqrt((x - n/2).^2 + (y - m/2).^2);
h = z > 50;  % Change here to create a high-pass filter

% Apply the filter
filtered_I = h .* I_shifted;

% Inverse DFT
I_new = ifftshift(filtered_I);
I_new = ifft2(I_new);

% Display the image
I_final = uint8(abs(I_new));

% Subplots of the outputs
figure;

% Original Image
subplot(2,3,1);
imshow(I);
title('Original Image');

% Frequency Spectrum (Magnitude)
subplot(2,3,2);
imagesc(log(abs(I_shifted) + 1));
colormap('gray');
title('Centered Spectrum');

% High-Pass Filter (Mask)
subplot(2,3,3);
imagesc(h);
colormap('gray');
title('High-Pass Filter h');

% Filtered Spectrum
subplot(2,3,4);
imagesc(log(abs(filtered_I) + 1));
colormap('gray');
title('Filtered Spectrum');

% Inverse FFT Image (Before Converting to uint8)
subplot(2,3,5);
imshow(abs(I_new), []);
title('Inverse FFT (abs)');

% Final Image
subplot(2,3,6);
imshow(I_final);
title('Final Image (uint8)');
saveas(gcf, 'C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure3.jpeg');