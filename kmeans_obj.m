function obj = kmeans_obj(X, C, a)
% computes the k-means objective function
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C (num_clusters x num_dims): cluster centers
%   a (num_samples x 1): cluster assignments (1, ..., num_clusters)
%                           for each data point
% OUTPUT:
%   obj (1 x 1): k-means objective function
%
% NOTES:
%   - do not use 'pdist2'---not supported by Autolab
warning ("off", "product: automatic broadcasting operation applied");

n = rows(X);
obj = 0;

for i = 1:n
	cluster_num = a(i,1);
	tempVal = norm((X(i,:) - C(cluster_num, :)),2);
	obj = obj + (tempVal ^2);
endfor

end
