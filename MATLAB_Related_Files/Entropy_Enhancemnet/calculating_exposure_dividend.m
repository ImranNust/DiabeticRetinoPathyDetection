function exposure_dividend = calculating_exposure_dividend(exposure, pixel_values)
%% CALCULATING_EXPOSURE_Dividend calculates the exposure_dividend of the image 
%
% exposure_dividend = calculating_exposure_dividend(exposure, pixel_values) will calculate
% the exposure-dividend to divid the image into two parts based on the
% exposure
%
% Inputs -- exposure: the exposure of the image X
%           pixel_values: the values of the intensities of image X
%
% Outputs -- exposure_dividend: the expsoure-dividend value; a scalar value

L = numel(pixel_values);
exposure_dividend = round(L*(1-exposure));

return