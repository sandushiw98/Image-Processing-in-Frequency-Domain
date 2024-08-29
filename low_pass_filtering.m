
clear;
I = imread('tire.tif');

% Calculate the DFT of the original image
I_dft = fft2(I);
I_dft_shift = fftshift(I_dft);  % Shift the zero-frequency components to the center

% Get the size of the original image
[m, n] = size(I);

% Create a meshgrid to define the filter
[x, y] = meshgrid(1:n, 1:m);
z = sqrt((x - n/2).^2 + (y - m/2).^2);

% Define the low-pass filter
h = z < 50;  % Circular low-pass filter with a radius of 50

% Apply the low-pass filter
filtered_dft = h .* I_dft_shift;

% Perform the Inverse DFT
NEW = ifft2(ifftshift(filtered_dft));
j = uint8(abs(NEW));  % Convert the real part of the inverse DFT to uint8

% Display the results using subplots
figure;
subplot(2,3,1);
imshow(I);
title('Original Image');

subplot(2,3,2);
imshow(log(abs(I_dft_shift)+1), []);
title('Centered DFT');

subplot(2,3,3);
imagesc(h);
axis image;  % Ensure the axes are scaled equally
colormap(gray);  % Use a grayscale colormap
title('Low-Pass Filter');

subplot(2,3,4);
imshow(log(abs(filtered_dft)+1), []);
title('Filtered DFT');

subplot(2,3,5);
imshow(abs(NEW), []);
title('Inverse DFT (Magnitude)');

subplot(2,3,6);
imshow(j);
title('Final Image');

sgtitle('Steps of Low-Pass Filtering');
saveas(gcf, 'C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure2.jpeg');