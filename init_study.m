% Prints the mean and the standard deviation of the objective value over 1000 runs
% The values reported are for both random and k-means ++ initialization

% Load the data matrix X (N X 2) - N samples
load kmeans_data

objsRandom = [];
objsKplus = [];

% Get the objective values for random/kmeans++ initialization
for i = 1:1000
  [best_C, best_a, best_obj] = kmeans_cluster(X, 9, 'random', 1);
  objsRandom(i) = best_obj;
  [best_C1, best_a1, best_obj1] = kmeans_cluster(X, 9, 'kmeans++', 1);
  objsKplus(i) = best_obj1;
endfor

objMean_Random = mean(objsRandom);
objSD_Random = std(objsRandom);
objMean_Kplus = mean(objsKplus);
objSD_KPlus = std(objsKplus);

printf("Mean for random initialization = %f \n", objMean_Random);
printf("Mean for k-means++ initialization = %f \n", objMean_Kplus);
printf("SD for random initialization = %f \n", objSD_Random);
printf("SD for k-means++ initialization = %f \n", objSD_KPlus);