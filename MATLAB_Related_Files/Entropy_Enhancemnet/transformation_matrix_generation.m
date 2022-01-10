function T = transformation_matrix_generation(comm_under_expossed,...
    comm_over_expossed,pixel_values, exposure_div)
%% transformation_matrix_generation will create a transform matrix
%
% T = transformation_matrix_generation(comm_under_expossed,
% comm_over_expossed, pixel_values, exposure_div) will create a
% transformation matrix that will be used to create an enhanced image.
%
% Inputs -- comm_under_expossed: the commulative distribution function of
%                                the under expossed region
%           comm_over_expossed:  the commulative distribution function of
%                                the over expossed region
%           pixel_values:        the intensity values of the image
%           exposure_div:        The exposure_div a scalar value
%
L = length(pixel_values);
TL = exposure_div*comm_under_expossed;
TU = (exposure_div+1)+(L-exposure_div+1)*comm_over_expossed;
%save('FL_MY_Code', 'FL');
%save('TU_My_Code', 'TU');

T = [TL';TU'];
end