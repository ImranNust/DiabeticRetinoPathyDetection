function exposure = calculating_exposure(freq_of_pixels, pixel_values)
%% CALCULATING_EXPOSURE calculates the exposure of the image to find out
%% the exposedness of the image
%
% Exp = calculating_exposure(freq_of_pixels, pixel_values) will calculate
% the exposure to find out over-exposed or under-exposed image
%
% Inputs -- freq_of_pixels: the frequency of the pixels in the image X
%           pixel_values: the values of the intensities of image X
%
% Outputs -- exposure: the expsoure value; a value less than 0.5 indicates an
% under-exposed image, a value greater than 0.5 indicates an over-exposed
% image, whereas values near 0.5 show a well balanced image.


L = numel(pixel_values);
exposure = (1/L)*(sum(freq_of_pixels.*pixel_values)/sum(freq_of_pixels));

return