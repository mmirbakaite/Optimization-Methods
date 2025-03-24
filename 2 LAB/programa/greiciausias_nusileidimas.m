function [x_0, y_0, iteracijos, f_iskv, L, x_masyvas, y_masyvas, reiksme] = greiciausias_nusileidimas (g, x0, y0, epsilon, max_it, f)
L=100;
iteracijos=0;
f_iskv=0;
x_masyvas = zeros(max_it, 1);
y_masyvas = zeros(max_it, 1);
while L> epsilon && iteracijos < max_it
    iteracijos=iteracijos+1;
    x_masyvas(iteracijos) = x0; 
    y_masyvas(iteracijos) = y0;
    gradientas = g(x0, y0);
    f_iskv = f_iskv+1;
    [x, L, it, x_arr_gold, x1_arr_gold, x2_arr_gold, kvietimas]=auksinis_pjuvis2(f, 0.0001, 100, 0, 6, gradientas, x0, y0);
    x_0=x0-x*gradientas(1);
    y_0=y0-x*gradientas(2);
    L=abs(x0-x_0);
    x0=x_0;
    y0=y_0;
end

x_masyvas = x_masyvas(1:iteracijos); 
y_masyvas = y_masyvas(1:iteracijos); 
reiksme=f(x0, y0);
end