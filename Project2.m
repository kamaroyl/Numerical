clear all
close all
%Read picture
A=imread('Picture','jpg');
%color to gray scale
A=rgb2gray(A);
%change to double matrix
A=im2double(A);
%Optional showing of the original image
%figure(1)
%imshow(A)
%dimensions of the image
s=size(A);
%Call the edge Map
C=MyEdgeMap(A,s);
%Change the edgemap to gray scale
C=mat2gray(C);
figure(2)
imshow(C)
%for i=1:4
    b=1;
    nt = 100;
    T=0.01;
    A=MyDenoise(b, nt, T, A, C);
    A=mat2gray(A);
    figure(3)
    imshow(A)
%end
