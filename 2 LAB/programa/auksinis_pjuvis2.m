function [x, L, it, x_arr_gold, x1_arr_gold, x2_arr_gold, f_sk] = auksinis_pjuvis2(f, epsilon, max_it, l, r, gradientas, x0, y0) 
t = (1+sqrt(5))/2-1; 
L= r-l;
x1 = r-t*L; 
x2 = 1 + t*L; 
it = 0; 
x_arr_gold = [];
x1_arr_gold = x1;
x2_arr_gold = x2;
fx1 = f(x0-x1*gradientas(1), y0-x1*gradientas(2));
fx2 = f(x0-x2*gradientas(1), y0-x2*gradientas(2));
f_sk = 2;

if fx1<fx2
    x = x1;
else
    x = x2;
end
x_arr_gold (it + 1) = x;
while L > epsilon && it < max_it
    if fx2 < fx1
        l = x1;
        L = abs(r-1);
        x1 = x2;
        x2 = 1+t*L;
        fx1 = fx2;
        fx2 = f(x0-x2*gradientas(1), y0-x2*gradientas(2)); 
        f_sk = f_sk + 1;
    else
        r = x2;
        L = abs(r-1);
        x1 = r-t*L;
        fx2 = fx1;
        fx1 = f(x0-x1*gradientas(1), x0-x1*gradientas(2));
        f_sk = f_sk + 1;
        it = it +1;
    end
    it = it +1;
    if fx1<fx2
        x = x1;
    else
        x = x2;
    end
    x_arr_gold (it + 1) = x;
    x1_arr_gold(it+1)=x1;
    x2_arr_gold(it+1)=x2;
end