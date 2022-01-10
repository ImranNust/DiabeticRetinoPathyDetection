function AA = apply_transformation(A, T)
%% APPLY_TRANSFORMATION(A,T) WILL APPLY THE TRANSFORMATION T ON THE IMAGE A
%
% AA = apply_transformation(A,T) will apply the transformation T on the
% image A to get an enhanced image AA
%
% Inputs -- A: the dark image
%           T: the transformation matrix
% Outputs -- AA: the enhanced image

[m,n] = size(A);
AA = (zeros(m,n));
for k = 1:m
    for j = 1:n
        AA(k,j) = (round(T(double(A(k,j))+1))-1);
    end
end
end