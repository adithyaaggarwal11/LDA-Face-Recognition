function [scatter_b] = scatter_between_total(mean)
scatter_b = [0];
mean_of_means = sum(mean(:,:),2)/30;
for i=1:30
     cal = (mean_of_means - mean(:,i)) * (mean_of_means - mean(:,i)).';
     scatter_b = scatter_b + cal;
end
   % display(scatter_b);

end