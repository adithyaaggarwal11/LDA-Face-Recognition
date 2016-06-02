function [person_test] = get_test_data()
size = 1600;
person_test = zeros(1600,0);

for i = 1:30
    
    path1 = strcat('Person', num2str(i));
    if(i<=9)
        path2 = strcat('Clip0',num2str(i));
    else
        path2 = strcat('Clip',num2str(i));
    end
    path = strcat(path1,'/Testing/',path2,'_light_-10.png');
    person=imread(path);
    person_resize = imresize(person,(sqrt(size)/128));
    person_gray=rgb2gray(person_resize);
    class=reshape(person_gray,size,1);
    person_test=[person_test,class(:,:)];
end