function clipped_histogram = calculating_clipped_histogram(freq_of_pixels,pixel_values)
%% CALCULATING_CLIPPED_HISTOGRAM calculate the clipped histogram
%
% clipped_histogram = calculating_clipped_histogram(freq_of_pixels,
% pixel_values) will calculate the clipped histogram accroding to a
% thredhold
%
% Inputs -- freq_of_pixels: frequency of the pixels
%           pixel_values: the values of the pixels
%
% Outputs -- clipped_histogram: a vector containing clipped histogram
% values

L = numel(pixel_values);
threshold = round(((1/L)*sum(freq_of_pixels)));
clipped_histogram = freq_of_pixels;
clipped_histogram(freq_of_pixels>=threshold) = threshold;
end