function out[t,y] = Euler_Forward(f, t_init, y_init, t_final, n)
%Find h
h = (t_final - t_init)/n;
%Set up Temp_t and Temp_y
Temp_t = [t_init zeros(1,n)];
Temp_y = [y_init zeros(1,n)];

    for j=1:n
        y(t(i+1))=y(t(i))+h*f(t(i),y(t(i)));
    end
    out
end