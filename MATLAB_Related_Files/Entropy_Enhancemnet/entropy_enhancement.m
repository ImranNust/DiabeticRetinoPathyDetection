function [Enh_Image,orig_entropy, enh_entropy] = entropy_enhancement(I)
%% This function will enhance the dynamic range, and thereby the entropy
%% of an image.


if ndims(I) == 2
    %% Applying DWT
    % Converting the input image into approximation, horizontal, vertical, and
    % diagonal bands using DWT
    [A, H, V, D] = dwt2(I,'haar');
    A = round(A);
    %% Calculating the Histogram of the approximation Band
    [f, p] = histogram_calculation(round(A));
    % figure; stem(p,f,'LineWidth',2); xlabel('Pixel Values'); ylabel('Frequency')
    %% Calculating the parameter exposuere
    exposure = calculating_exposure(f, p);
    %     disp(['The exposure of image ', num2str(i), ' is ', num2str(exposure)])
    %% Calculating the exposure-dividend
    exposure_div = calculating_exposure_dividend(exposure, p);
    %     disp(['The exposure-divident value for image ', num2str(i), ' is ', num2str(exposure_div)]);

    %% Calculating Clipped Histogram
    clipped_histogram = calculating_clipped_histogram(f, p);
    %     figure; stem(p, clipped_histogram)
    %% Calculating the normalized histogram of the over expossed and under expossed regions
    [Norm_Hist_UExpossed, Norm_Hist_OExpossed] = normalized_histogram_of_over_under_exposed_regions(p,...
        clipped_histogram,exposure_div);

    %% Calculating the commulative distribution function
    comm_under_expossed = cumsum(Norm_Hist_UExpossed);
    comm_over_expossed = cumsum(Norm_Hist_OExpossed);

    %% Transformation Matrix Generation
    T = transformation_matrix_generation(comm_under_expossed,...
        comm_over_expossed,p, exposure_div);

    %% Applying the Transformation
    AA = apply_transformation(A, T);

    %% Applying the IDWT to get the enhanced image
    Enh_Image = uint8(idwt2(AA, H, V, D, 'haar'));
    %% If want to see the image obtained using state-of-the-art techniques
    %     figure;
    %     subplot(221);imshow(Enh_Image); title('Proposed Technique');
    %     ESIHE_ALGO_Image = ESIHE_ALGO(I);
    %     subplot(222);imshow(ESIHE_ALGO_Image); title('ESIHE_ALGO_Image ');
    %     histeq_Image = histeq(I);
    %     subplot(223);imshow(Enh_Image); title('histeq_Image');
    %     fcnBPDFHE_Image = fcnBPDFHE(I);
    %     subplot(224);imshow(Enh_Image); title('fcnBPDFHE_Image');
    %     imwrite(Enh_Image, sprintf('ESIHE_ALGO_Image%d.png',i))
    %     imwrite(Enh_Image, sprintf('histeq_Image%d.png',i))
    %     imwrite(Enh_Image, sprintf('fcnBPDFHE_Image%d.png',i))
    %% Quantitative Analysis
    % Entropy Calculating
    orig_entropy = calculating_entropy(I);
    enh_entropy = calculating_entropy(Enh_Image);
elseif ndims(I) == 3
    Enh_Image = uint8(zeros(size(I)));
    orig_entropy = 0;
    enh_entropy = 0;
    for i = 1:3
        %% Applying DWT
        % Converting the input image into approximation, horizontal, vertical, and
        % diagonal bands using DWT
        [A, H, V, D] = dwt2(I(:,:,i),'haar');
        A = round(A);
        %% Calculating the Histogram of the approximation Band
        [f, p] = histogram_calculation(round(A));
        % figure; stem(p,f,'LineWidth',2); xlabel('Pixel Values'); ylabel('Frequency')
        %% Calculating the parameter exposuere
        exposure = calculating_exposure(f, p);
        %     disp(['The exposure of image ', num2str(i), ' is ', num2str(exposure)])
        %% Calculating the exposure-dividend
        exposure_div = calculating_exposure_dividend(exposure, p);
        %     disp(['The exposure-divident value for image ', num2str(i), ' is ', num2str(exposure_div)]);

        %% Calculating Clipped Histogram
        clipped_histogram = calculating_clipped_histogram(f, p);
        %     figure; stem(p, clipped_histogram)
        %% Calculating the normalized histogram of the over expossed and under expossed regions
        [Norm_Hist_UExpossed, Norm_Hist_OExpossed] = normalized_histogram_of_over_under_exposed_regions(p,...
            clipped_histogram,exposure_div);

        %% Calculating the commulative distribution function
        comm_under_expossed = cumsum(Norm_Hist_UExpossed);
        comm_over_expossed = cumsum(Norm_Hist_OExpossed);

        %% Transformation Matrix Generation
        T = transformation_matrix_generation(comm_under_expossed,...
            comm_over_expossed,p, exposure_div);

        %% Applying the Transformation
        AA = apply_transformation(A, T);

        %% Applying the IDWT to get the enhanced image
        Enh_Image(:,:,i) = idwt2(AA, H, V, D, 'haar');
        %% If want to see the image obtained using state-of-the-art techniques
        %     figure;
        %     subplot(221);imshow(Enh_Image); title('Proposed Technique');
        %     ESIHE_ALGO_Image = ESIHE_ALGO(I);
        %     subplot(222);imshow(ESIHE_ALGO_Image); title('ESIHE_ALGO_Image ');
        %     histeq_Image = histeq(I);
        %     subplot(223);imshow(Enh_Image); title('histeq_Image');
        %     fcnBPDFHE_Image = fcnBPDFHE(I);
        %     subplot(224);imshow(Enh_Image); title('fcnBPDFHE_Image');
        %     imwrite(Enh_Image, sprintf('ESIHE_ALGO_Image%d.png',i))
        %     imwrite(Enh_Image, sprintf('histeq_Image%d.png',i))
        %     imwrite(Enh_Image, sprintf('fcnBPDFHE_Image%d.png',i))
        %% Quantitative Analysis
        % Entropy Calculating
        orig_entropy  = calculating_entropy(I)+orig_entropy;
        enh_entropy = calculating_entropy(Enh_Image)+enh_entropy;
    end
        orig_entropy = orig_entropy/3;
        enh_entropy = enh_entropy/3;
else
    print('Unknown Input');
end
%% If want to see the original and enhanced image obtained using our technique
% figure
% subplot(121);imshow(I); title('Image ');
% subplot(122);imshow(Enh_Image); title('The Enhanced Image ');
    %     imwrite(Enh_Image, sprintf('Enh_Image%d.png',i))
    %%%%%%%%%%%
return