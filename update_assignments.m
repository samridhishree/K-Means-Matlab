function a = update_assignments(X, C, a)
% computes assignments, given data points and cluster centers
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   a (num_samples x 1): updated assignments
%
% NOTES:
%   - do not use 'pdist2'---not supported by Autolab
warning ("off", "product: automatic broadcasting operation applied");

n = rows(X);

for i = 1:n
	% Extract each sample from the matrix
	dataVector = X(i,:);
	tempCost = bsxfun(@minus, C, dataVector);
	tempDistance = sumsq(tempCost, 2);
	[minVal, index] = min(tempDistance);
	a(i,1) = index;
endfor
end
