%% Some parameters to set - make sure that your code works at image borders!
patchSize = 2;
sigma = 20; % standard deviation (different for each image!)
h = 0.55; %decay parameter
windowSize = 8;

imageNoisy = zeros(200, 200);
imageReference = zeros(200, 200);

tic;
%Implement the non-local means function
filtered = nonLocalMeans(imageNoisy, sigma, h, patchSize, windowSize);
toc

%% Let's see the results!

%Show the denoised image
figure('name', 'NL-Means Denoised Image');
imshow(filtered);

%Show difference image
diff_image = abs(image - filtered);
figure('name', 'Difference Image');
imshow(diff_image / max(max((diff_image))));

%Print some statistics ((Peak) Signal-To-Noise Ratio)
disp('For Noisy Input');
[peakSNR, SNR] = psnr(imageNoisy, imageReference);
disp(['SNR: ', num2str(SNR, 10), '; PSNR: ', num2str(peakSNR, 10)]);

disp('For Denoised Result');
[peakSNR, SNR] = psnr(filtered, imageReference);
disp(['SNR: ', num2str(SNR, 10), '; PSNR: ', num2str(peakSNR, 10)]);
