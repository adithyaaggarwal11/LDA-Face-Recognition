function []=main()
scatter_within_total = [0];
person2 = zeros(1600,0);

for i = 1:30
    
    path1 = strcat('Person', num2str(i));
    if(i<=9)
        path2 = strcat('Clip0',num2str(i));
    else
        path2 = strcat('Clip',num2str(i));
    end
    path = strcat(path1,'/Training/',path2,'_light_');
    person = read_data(path);
    person2=[person2,person(:,:)];
    mean(:,i) = sum(person(:,:),2)/10;
    
    scatter_w = scatter_within(person,mean(:,i));
    
    scatter_within_total  = scatter_within_total + scatter_w;
    
  
end



scatter_b = scatter_between_total(mean);
scatter_b = (1/30)*scatter_b;
scatter_within_total = (1/30)*scatter_within_total;


[Eigenvector, Eigenvalues] = eigs(inv(scatter_within_total)*scatter_b,29);
positive_negative_bar = (real(diag(Eigenvalues)));
positive_negative_bar(find(positive_negative_bar<0))=0;
bar(positive_negative_bar);
person_test = get_test_data();
projected_training = projected(person2, Eigenvector);
projected_test = projected(person_test, Eigenvector);
save('file3.mat','projected_training');
display(size(projected_test));
display(size(projected_training));
k=1;
for i=1:300
   
    trainingClasses(i,1) = k;
    if mod(i,10)==0
        k=k+1;
    end
end
testClasses = knnclassify((projected_test.'), (projected_training.'), trainingClasses,1,'euclidean');
accuracy = 0;

for i=1:30
    if(testClasses(i) == i)
        accuracy = accuracy + 1;
    end
end
accuracy = double((accuracy/30)*100);

display(accuracy);
display(testClasses);


end