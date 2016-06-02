function [scatter_w] = scatter_within(person,mean)
scatter_w = [0];
person = double(person);
n = size(person,2);
for i=1:n
    cal = (person(:,i) - mean) * (person(:,i) - mean).';
    scatter_w = scatter_w + cal;
end
    %display(size(scatter_w));
