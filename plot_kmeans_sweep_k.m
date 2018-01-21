% Script that plots kmean obj vs. number of clusters, k
%
% Finish the script where indicated
%
% HW5, 1.f

load kmeans_data
    % returns X (N x 2): data matrix for N samples

%%%%%% COMPLETE CODE HERE %%%%%%%%
% Use kmeans_cluster.m to obtain 
%   the objective function valuesfor k=1,...,20
% Save objective function values in the variable 'objs'

objs = [];
for k=1:20
	[best_C, best_a, best_obj] = kmeans_cluster(X, k, 'random', 10);
	objs(k) = best_obj;
endfor

%%%%%% DO NOT CHANGE FOLLOWING CODE %%%%%%%%
f = figure;
plot(objs, 'x-');
ylabel('kmeans obj value');
xlabel('number of clusters, k');


