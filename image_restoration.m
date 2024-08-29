function image_restoration()
    % Load an image (Convert it to grayscale if it's RGB)
    originalImg = imread("C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\girl.jpg");

    % Display the original image
    figure;
    subplot(1,3,1);
    imshow(originalImg);
    title('Original Image');

    if size(originalImg, 3) == 3
        originalImg = rgb2gray(originalImg);
    end
    
    
    % Add Gaussian noise to the original image
    noisyImg = imnoise(originalImg, 'gaussian', 0, 0.01);  % Adjust the variance as needed
    subplot(1,3,2);
    imshow(noisyImg);
    title('Noisy Image');
    
    % Apply the Wiener Filter
    restoredImg = wiener2(noisyImg, [5 5]);  % The neighborhood size can be adjusted
    subplot(1,3,3);
    imshow(restoredImg);
    title('Restored Image');

    saveas(gcf, 'C:\Users\Sandushi\Documents\4th year\4th Year 1st Sem\Image Processing\Figure4.jpeg');
end
