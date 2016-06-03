# LDA-Face-Recognition

## Procedure

Programming Steps:
- Initial size of image is a matrix of size 128x128x3, which corresponds to the rgb intensity
values of the image.
- For all calculations the gray scale value of the image is used, it reduces the dimension of
each of the images to a 128x128x1 matrix.
- Since carrying out matrix computations on a 128x128 matrix is time consuming on an
averagely configured pc, I have resized the images and performed computation for a
40x40 matrix, 64x64 matrix and 96x96 matrix.
- Each of the images is then represented as vector forms, reshaping the original image
matrix performs this task. Now, each image is represented by a 1600x1 vector(for a
40x40 size image).
- We need the means of each of the classes to compute the within class scatter matrix.
Once the mean is computed for that particular class we compute the within class scatter
by summation Pr(C)*(x-m)*(x-m)’ for every x in the set. (x = each of the image in the
training set, m = mean of the images)
- To calculate the total within class scatter we add all the within class scatter matrices from
all the classes.
- Now to calculate the between class scatter we need the mean of all the classes and the
total mean of the 300 classes. The between scatter matrix is formed by summation
Pr(C)*(m-m`)*(m-m`)’ for each class(m = mean of that class, m` = mean of all the
classes).
- Eigenvalues and corresponding Eigenvectors are now computed from the equation
w=inverse (Sw) * Sb (Sw = Scatter within class, Sb = Scatter between class).
- Project the training images onto the set of Eigenvectors (different number of
Eigenvectors are taken to check for varying accuracy).
- Project the testing images onto the same set of Eigenvectors.
- Now we have our projected training set and our projected test set.
- We pass these two sets to a Euclidean/KNN classifier to get the accuracy of our model.

## How to run the Matlab Code

- Code consists of 6 functions(6 files)

1. main
2. read_data
3. projected
4. scatter_within
5. scatter_between_total
6. get_test_data

- main – computes the within scatter for all classes, between scatter, finding
out eigenvectors and eigenvalues, projection of images(test and training) and
classification using KNN and finally computes the accuracy of the
classification.
- read_data – returns a matrix to the main function that consists of all the
images for 1 person in a vector form. Therefore it consists of 10 columns and
rows depend on the size of the matrix after resizing (incase of 40x40, rows
are 1600).
- Projected – computes the projection using eigenvectors and the training/test
data sets, returns the projected set to the main function. Parameters it takes is
the set of all training images and the set of Eigenvectors computed.
- Scatter_within – computes the scatter within every class. Parameters it takes
is the set of training images for a particular person and the mean for that
particular class.
- Scatter_between_total – returns the value of the total between scatter to the
main function, parameters it takes is the mean of all the training sets.
- Get_test_data - returns a matrix to the main function that consists of all the
test images for all person in a vector form. Therefore it consists of 30
columns and rows depend on the size of the matrix after resizing (incase of
40x40, rows are 1600).

## Output

1. dimension of projected test data set
2. dimension of projected training data set
3. accuracy of classification of test data set
4. classified test cases
