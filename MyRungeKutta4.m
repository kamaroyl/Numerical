function y_new = MyRungeKutta4(f,h,ya)
% - - -Runge-Kutta 4
%Performs one step of the RK4 algorithm
%Use: 
% f  function call
% a left endpoint 
% b right endpoint
% ya initial value
% ng grid size
% T independent coordinates
% Y dependent coordinates

% - - -
    s_1 = f(t_temp,y_temp)
    s_2 = f(t_temp+(h/2), y_temp+(h/2)*s_1);
    s_3 = f(t_temp+(h/2), y_temp+(h/2)*s_2);
    s_4 = f(t_temp+h, y_temp+h*s_3);
    y_new = ya+(h/6)*(s_1+2*s_2+2*s_3+s_4); 
end