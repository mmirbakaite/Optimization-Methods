function [x_0, y_0, iteracijos, g_sk, L, x_masyvas, y_masyvas, reiksme] = gradiento_nusileidimas(f, g, x0, y0, gamma, epsilon, max_it) 
L=100;
iteracijos=0;
g_sk=0;
x_masyvas = zeros (max_it, 1);
y_masyvas = zeros (max_it, 1);

while L>=epsilon && iteracijos<max_it
    iteracijos=iteracijos+1; 
    x_masyvas(iteracijos) = x0; 
    y_masyvas(iteracijos) = y0;
    gradientas = g(x0, y0);
    g_sk=g_sk+1;
    x_0=x0-gamma*gradientas(1); 
    y_0=y0-gamma*gradientas(2);
    L=abs(x0-x_0);
    x0=x_0; 
    y0=y_0;
end

x_masyvas = x_masyvas(1:iteracijos); 
y_masyvas = y_masyvas(1:iteracijos);
reiksme=f(x0, y0);
end