function class = read_data(path)
size = 1600;
for i = 0: 10: 90
    path_full = strcat(path,num2str(i),'.png');
    person=imread(path_full);
    person_resize = imresize(person,(sqrt(size)/128));
    person_gray=rgb2gray(person_resize);
    j=(i/10)+1;
    class(:,j)=reshape(person_gray,size,1);
    
end

end


