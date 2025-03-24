function [trikampis, iteracijos, f_sk, xx, yy, reiksmes, x_0, y_0, kelias] = simpleksas (f, x0, y0, max_it, alfa)
gamma=1;
beta=0.5;
epsilon=-0.5;
iteracijos=0;
delta1=((sqrt(3)+1)/(2*sqrt(2)))*alfa; 
delta2=((sqrt(3)-1)/(2*sqrt(2)))*alfa;
L=100;
x1 = [x0, y0];
x2 = [delta1, delta2];
x3 = [delta2, delta1];
trikampis = [x1; x2; x3];
f_sk=0;
kelias = [x0, y0]; 
xx=[x0, delta1, delta2];
yy=[y0, delta2, delta1];

while iteracijos < max_it && L>0.0001
    iteracijos = iteracijos + 1;
    reiksmes=[f(trikampis (1, 1), trikampis (1, 2)); f(trikampis (2, 1), trikampis (2, 2)); f(trikampis (3, 1), trikampis (3, 2))];
    [reiksmes, indeksai] = sort(reiksmes);
    trikampis = trikampis (indeksai,:);
    f_sk=f_sk+3;
    L=abs(trikampis (1,1)-trikampis (2,1));
    centras = mean (trikampis (1:end-1,:));
    x_naujas = centras + alfa * (centras - trikampis (end-1:end));
    kelias = [kelias; x_naujas]; 
    f_naujas = f(x_naujas (1), x_naujas (2));
    f_sk = f_sk + 1;
    if (reiksmes (1) <= f_naujas) && (f_naujas < reiksmes (end))
        trikampis (3,1)=x_naujas(1);
        trikampis (end)=x_naujas (2);
        xx=[xx, x_naujas (1)];
        yy=[yy, x_naujas(2)];
    elseif f_naujas < reiksmes (1)
        x=centras+gamma*(x_naujas-centras);
        fx=f(x(1), x(2));
        f_sk=f_sk+1;
        if fx < f_naujas
            trikampis (3,1)=x(1);
            trikampis (end)=x(2);
            xx=[xx, x(1)];
            yy=[yy, x(2)];
            trikampis = [x1; x2; x3];
        else
            trikampis (3,1)=x_naujas(1);
            trikampis (end)=x_naujas(2);
            xx=[xx, x_naujas(1)];
            yy=[yy, x_naujas(2)];
        end
    else
        xe=centras + beta * (trikampis (end-1:end)-centras); fe=f(xe(1), xe(2));
        f_sk=f_sk+1;
        if fe < reiksmes (end)
            trikampis (3, 1)=xe(1);
            trikampis (end)=xe(2);
            xx=[xx, x(1)];
            yy=[yy, x(2)];
        else
            trikampis (2,1)=trikampis (2,1)+epsilon* (trikampis (2,1)-trikampis (1,1));
            trikampis (2,2)=trikampis (2,2)+epsilon* (trikampis (2,2)-trikampis (1,2));
            trikampis (3,1)=trikampis (3,1)+epsilon* (trikampis (3,1)-trikampis (3,1)); trikampis (3,2)=trikampis (3,2)+epsilon* (trikampis (3,2)-trikampis (3,2));
            xx=[xx, trikampis(2,1)];
            yy=[yy, trikampis(2,2)];
            xx=[xx, trikampis(3,1)];
            yy=[yy, trikampis(3,2)];
            reiksmes=[f(trikampis (1, 1), trikampis(1, 2))];
        end
    end
    
end
x_0=trikampis(1,1);
y_0=trikampis(1,2);
end
