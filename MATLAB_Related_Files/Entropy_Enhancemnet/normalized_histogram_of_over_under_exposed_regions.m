function [Norm_Hist_UExpossed, Norm_Hist_OExpossed] = normalized_histogram_of_over_under_exposed_regions(pixel_values, clipped_histogram,exposure_div)
%% NORMALIZED_HISTOGRAM_OF_OVER_UNDER_EXPOSED_REGIONS will calculate the normalized
%% histogram of the over and under exposed regions of the image
%
% [Norm_Hist_UExpossed, Norm_Hist_OExpossed] =
% normalized_histogram_of_over_under_exposed_regions(pixel_values,
% clipped_histogram, exposure_div) will calculate the normalized histogram
% of the over and under exposed regions of the image.
%
% Inputs -- pixel_values: it is a vector contaiing the intensity values;
%                         for an 8-bit image it is 0 to 255, whereas for
%                         the approximation band it is 0 to 511 (we have
%                         conducted several experiments to reach to this
%                         region, and it works extremely well.)
%           clipped_histogram: This is also a vector that contains the
%                              clipped histogram
%
% Outputs -- Norm_Hist_UExpossed: The normalized histogram of the under
%                                 exposed region
%            Norm_Hist_OExpossed: The normalized histogram of the over 
%                                 exposed region

L = numel(pixel_values);
XL = sum(clipped_histogram(1:exposure_div+1));
XU = sum(clipped_histogram(exposure_div+2:L));
Norm_Hist_UExpossed = clipped_histogram(1:exposure_div+1)/XL;
epsilon = 0.001;
if isequal(XU,0)
    Norm_Hist_OExpossed = clipped_histogram(exposure_div+2:L)/(XU+epsilon);
else
    Norm_Hist_OExpossed = clipped_histogram(exposure_div+2:L)/XU;
end

end