% Clear the workspace
clear;
clc;
close all;

% Step 1: Create an image with a white rectangle and black background
f = zeros(30, 30);
f(5:24, 13:17) = 1;

% Display the original image
figure;
subplot(2,2,1);
imshow(f, 'InitialMagnification', 'fit');
title('Original Image');

% Step 2: Calculate the Discrete Fourier Transform (DFT) with zero padding
F = fft2(f, 256, 256);
F2 = abs(F);

% Display the magnitude of the Fourier transform without shift
subplot(2,2,2);
imshow(F2, [], 'InitialMagnification', 'fit');
title('Magnitude of DFT');

% Step 3: Shift zero-frequency components to the center of the array
Fshifted = fftshift(F);
F3 = abs(Fshifted);

% Display the shifted Fourier spectrum
subplot(2,2,3);
imshow(F3, []);
title('Centered Fourier Spectrum');

% Step 4: Logarithmic scaling to enhance display
F4 = log(1 + F3);

% Display the logarithmically scaled Fourier spectrum
subplot(2,2,4);
imshow(F4, []);
title('Log-Scaled Fourier Spectrum');

% Adding a figure title
sgtitle('Figure 1: Fourier Transform Steps');

% Save the figure as a JPEG image
saveas(gcf, 'C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure1.jpeg');


