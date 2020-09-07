clear all
close all
%Test the lorenz function
y=zeros(3,10);
 for j=1:10
     for i=1:3
         y(i,j) = j;
     end
y_dot=MyLorenz(y(:,j), 10,28, (8/3))
 end


y