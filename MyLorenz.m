function z = MyLorenz(y, s, r, b)
%Lorenz System of Equations
%Takes in time vector, 
z(1) = s*(y(2) - y(1));
z(2) = y(1)*(r-y(3))-y(2);
z(3) = y(1)*y(2)-b*y(3);
