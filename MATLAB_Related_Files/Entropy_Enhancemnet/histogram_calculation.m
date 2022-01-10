function [freq_of_pixels, pixel_values] = histogram_calculation(X)
%% HISTOGRAM_CALCULATION Calculates the histogram of the approximation band.
%
% [freq_of_pixels, pixel_values] = histogram_calculation(X) will calculate
% the histogram of X, and will return the pixel values and its  frequencey.
%
% Inputs -- X: that may be an 8-bit image or approximation band in case of
% DWT transformation.
%
% Outputs -- freq_of_pixels: the frequency of the pixels in X
%            pixel_values: intensity values
X = (X(:));
if isa(X,'uint8')
    [freq_of_pixels,~] = histcounts(X(:),'BinMethod','integers','BinLimits',[0,255]);
    pixel_values = 0:255;
elseif isa(X,'double')
    [freq_of_pixels,~] = histcounts(X(:),'BinMethod','integers','BinLimits',[0,511]);
    pixel_values = 0:511;
else
    error('Unknown Data Type');
end

end