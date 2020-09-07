function out = ABMTwoStep(w, f, a, b, nt)

    w(i+1)=w(i)+(h/12)*(5*f(i+1)+8f(i)-f(i-1));