function ent = calculating_entropy(X)
%% CALCULATING_ENTROPY will calculate the entropy of the image X
%
% ent = calculating_entropy(X) will calculate the entropy of image X
%
% Inputs -- X: an input image
%
% Outputs -- ent: a scalar quantity, representing the entropy of the image
% X


L = 256; % It is considered that the given image
X = (X(:));
xpdf = histcounts(X(:),'BinLimits',[0,L-1],'BinMethod','integers')/numel(X(:));
% removing zero entries from xpdf
xpdf(xpdf==0) = [];
ent = -sum(xpdf.*log2(xpdf));

return