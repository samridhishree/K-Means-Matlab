function C = update_centers(X, C, a)
% updates cluster centers, given data points and assignments
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   C (num_clusters x num_dims): updated cluster centers
warning ("off", "product: automatic broadcasting operation applied");

n = rows(C);

% Update each centers
for i = 1:n
	dataInCluster = (a == i);
	numRowsInCluster = sum(dataInCluster);
	clusterData = X .* dataInCluster;
	% Take the column wise sum
	dataSum = sum(clusterData, 1);
	C(i, :) = dataSum ./ numRowsInCluster;
endfor
end
