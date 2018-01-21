function [C, a] = lloyd_iteration(X, C0)
% runs Lloyds method until convergence
% INPUT:
%   X (num_samples x num_dims): data matrix
%   C0 (num_clusters x num_dims): initialized cluster centers
% OUTPUT:
%   C (num_clusters x num_dims): updated cluster centers
%   a (num_samples x 1): cluster assignment for each sample
warning ("off", "product: automatic broadcasting operation applied");

C_old = C0;
C_curr = C_old;
n = rows(X);
a_old = ones(n,1);
a_curr = a_old;

for iter = 1:1000
	a_curr = update_assignments(X, C_old, a_old);
	C_curr = update_centers(X, C_old, a_curr);
	if(a_curr == a_old)
		break;
	endif
	C_old = C_curr;
	a_old = a_curr;
endfor

C = C_curr;
a = a_curr;

end
