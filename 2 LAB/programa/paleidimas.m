%tikslo f-ja
f = @(x, y) (1/8.*x.^2.*y+1/8.*x.*y.^2-1/8.*x.*y);
%gradiento formule
g = @(x,y) [1/4.*x.*y+1/8.*y.^2-1/8.*y; 1/8.*x.^2+1/4.*x.*y-1/8.*x];
%Gradiento nusileidimo algoritmas (0,0)
[x_0_0, y_0_0, iter_0, g_sk_0, L_0, X_0, Y_0, r_0] = gradientinis (f, g, 0, 0, 3, 0.0001, 50);
%Gradiento nusileidimo algoritmas (1,1)
[x_0_1, y_0_1, iter_1, g_sk_1, L_1, X_1, Y_1, r_1] = gradientinis (f, g, 1, 1, 2.7, 0.0001, 50);
%Gradiento nusileidimo algoritmas (8/10,4/10)
[x_0_2, y_0_2, iter_2, g_sk_2, L_2, X_2, Y_2, r_2] = gradientinis (f, g, 8/10, 4/10, 10.8, 0.0001, 50);
%Greiciausio nusileidimo algoritmas (0,0)
[x_0_3, y_0_3, iter_3, g_sk_3, L_3, X_3, Y_3, r_3] = greiciausias (g, 0, 0, 0.0001, 100, f);
%Greiciausio nusileidimo algoritmas (1,1)
[x_0_4, y_0_4, iter_4, g_sk_4, L_4, X_4, Y_4, r_4] = greiciausias (g, 1, 1, 0.0001, 100, f);
%Greiciausio nusileidimo algoritmas (8/10,4/10)
[x_0_5, y_0_5, iter_5, g_sk_5, L_5, X_5, Y_5, r_5] = greiciausias(g, 8/10, 4/10, 0.0001, 100, f);
% Deformuojamo simplekso algoritmas (0,0)
[triangle_1, iter_6, g_sk_6, X_6, Y_6, r_6, x_0_6, y_0_6] =  simpleksas(f, 0, 0, 100, 0.7);
% Deformuojamo simplekso algoritmas (1,1)
[triangle_2, iter_7, g_sk_7, X_7, Y_7, r_7, x_0_7, y_0_7] =  simpleksas(f, 1, 1, 100, 0.5);
% Deformuojamo simplekso algoritmas (8/10,4/10)
[triangle_3, iter_8, g_sk_8, X_8, Y_8, r_8, x_0_8, y_0_8] =  simpleksas(f, 8/10, 4/10, 100, 0.8);

Methods = ["Gradiento nusileidimo algoritmas"; "Gradiento nusileidimo algoritmas"; "Gradiento nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Deformuojamo simplekso algoritmas"; "Deformuojamo simplekso algoritmas"; "Deformuojamo simplekso algoritmas"];
x_values = [x_0_0; x_0_1; x_0_2; x_0_3; x_0_4; x_0_5; x_0_6; x_0_7; x_0_8];
y_values = [y_0_0; y_0_1; y_0_2; y_0_3; y_0_4; y_0_5; y_0_6; y_0_7; y_0_8];
iter_count = [iter_0; iter_1; iter_2; iter_3; iter_4; iter_5; iter_6; iter_7; iter_8]; 
fja_count = [g_sk_0; g_sk_1; g_sk_2; g_sk_3; g_sk_4; g_sk_5; g_sk_6; g_sk_7; g_sk_8];
starting_point = ["(0, 0)"; "(1, 1)"; "(8/10, 4/10)"; "(0, 0)"; "(1, 1)"; "(8/10, 4/10)"; "(0, 0)"; "(1, 1)"; "(8/10, 4/10)"];
func_values = [r_0; r_1; r_2; r_3; r_4; r_5; r_6; r_7; r_8];
tbl = table(Methods, starting_point, x_values, y_values, iter_count, fja_count, func_values);
display(tbl)
writetable(tbl, "results.xlsx")

[X, Y] = meshgrid(-1.5:0.1:1.5, -1.5:0.1:1.5);
figure;
surf(X, Y, f(X, Y));
hold on;
plot3(X_4, Y_4, f(X_4, Y_4), 'ro', 5);  
    hold off
    xlabel('x');
    ylabel('y');
    zlabel('f(x, y)');
%tikslo f-ja
f = @(x, y) (1/8.*x.^2.*y+1/8.*x.*y.^2-1/8.*x.*y);
%gradiento formule
g = @(x,y) [1/4.*x.*y+1/8.*y.^2-1/8.*y; 1/8.*x.^2+1/4.*x.*y-1/8.*x];
%Gradiento nusileidimo algoritmas (0,0)
[x_0_0, y_0_0, iter_0, g_sk_0, L_0, X_0, Y_0, r_0] = gradientinis (f, g, 0, 0, 3, 0.0001, 50);
%Gradiento nusileidimo algoritmas (1,1)
[x_0_1, y_0_1, iter_1, g_sk_1, L_1, X_1, Y_1, r_1] = gradientinis (f, g, 1, 1, 2.7, 0.0001, 50);
%Gradiento nusileidimo algoritmas (8/10,4/10)
[x_0_2, y_0_2, iter_2, g_sk_2, L_2, X_2, Y_2, r_2] = gradientinis (f, g, 8/10, 4/10, 10.8, 0.0001, 50);
%Greiciausio nusileidimo algoritmas (0,0)
[x_0_3, y_0_3, iter_3, g_sk_3, L_3, X_3, Y_3, r_3] = greiciausias (g, 0, 0, 0.0001, 100, f);
%Greiciausio nusileidimo algoritmas (1,1)
[x_0_4, y_0_4, iter_4, g_sk_4, L_4, X_4, Y_4, r_4] = greiciausias (g, 1, 1, 0.0001, 100, f);
%Greiciausio nusileidimo algoritmas (8/10,4/10)
[x_0_5, y_0_5, iter_5, g_sk_5, L_5, X_5, Y_5, r_5] = greiciausias(g, 8/10, 4/10, 0.0001, 100, f);
% Deformuojamo simplekso algoritmas (0,0)
[triangle_1, iter_6, g_sk_6, X_6, Y_6, r_6, x_0_6, y_0_6] =  simpleksas(f, 0, 0, 100, 0.7);
% Deformuojamo simplekso algoritmas (1,1)
[triangle_2, iter_7, g_sk_7, X_7, Y_7, r_7, x_0_7, y_0_7] =  simpleksas(f, 1, 1, 100, 0.5);
% Deformuojamo simplekso algoritmas (8/10,4/10)
[triangle_3, iter_8, g_sk_8, X_8, Y_8, r_8, x_0_8, y_0_8] =  simpleksas(f, 8/10, 4/10, 100, 0.8);

Methods = ["Gradiento nusileidimo algoritmas"; "Gradiento nusileidimo algoritmas"; "Gradiento nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Greiciausio nusileidimo algoritmas"; "Deformuojamo simplekso algoritmas"; "Deformuojamo simplekso algoritmas"; "Deformuojamo simplekso algoritmas"];
x_values = [x_0_0; x_0_1; x_0_2; x_0_3; x_0_4; x_0_5; x_0_6; x_0_7; x_0_8];
y_values = [y_0_0; y_0_1; y_0_2; y_0_3; y_0_4; y_0_5; y_0_6; y_0_7; y_0_8];
iter_count = [iter_0; iter_1; iter_2; iter_3; iter_4; iter_5; iter_6; iter_7; iter_8]; 
fja_count = [g_sk_0; g_sk_1; g_sk_2; g_sk_3; g_sk_4; g_sk_5; g_sk_6; g_sk_7; g_sk_8];
starting_point = ["(0, 0)"; "(1, 1)"; "(8/10, 4/10)"; "(0, 0)"; "(1, 1)"; "(8/10, 4/10)"; "(0, 0)"; "(1, 1)"; "(8/10, 4/10)"];
func_values = [r_0; r_1; r_2; r_3; r_4; r_5; r_6; r_7; r_8];
tbl = table(Methods, starting_point, x_values, y_values, iter_count, fja_count, func_values);
display(tbl)
writetable(tbl, "results.xlsx")

[X, Y] = meshgrid(-1.5:0.1:1.5, -1.5:0.1:1.5);
figure;
surf(X, Y, f(X, Y));
hold on;
plot3(X_4, Y_4, f(X_4, Y_4), 'ro', 5);  
    hold off
    xlabel('x');
    ylabel('y');
    zlabel('f(x, y)');
