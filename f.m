function yOut=f(mu, y)

r = sqrt(y(1)^2+y(3)^2);

yOut = [y(2) ; -mu*y(1)/r^3 ; y(4) ; -mu*y(3)/r^3];