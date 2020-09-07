clear all
close all
A=imread('Picture','jpg');
A=rgb2gray(A);
B=im2double(A);
figure(1)
imshow(B)
s=size(A);
C=MyEdgeMap(B,s);
figure(2)
imagesc(C)
