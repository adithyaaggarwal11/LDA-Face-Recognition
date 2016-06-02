function [projected_training] = projected(person2, Eigenvector)

   person2 = double(person2);
    W = Eigenvector(:,1:15);
    Z = W.';
   
   projected_training = Z * person2;
end