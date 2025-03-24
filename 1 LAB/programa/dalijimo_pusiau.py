import numpy as np
import matplotlib.pyplot as plt

studento_nr = "1717745"
studento_numeris = [int(char) for char in studento_nr]
#studento_numeris = [1, 3, 1, 3 , 3 , 7 ,6]

a = studento_numeris[5]

if studento_numeris[6] == 0:
    digits_sum = sum(studento_numeris)  
    while digits_sum > 9:
        digits_sum = sum(int(digit) for digit in str(digits_sum))
    b = digits_sum
else:
    b = studento_numeris[6]

# f(x) = ((x^2 - a)^2) / b - 1
def f(x):
    return ((x ** 2 - a) ** 2) / b - 1

# Intervalo dalijimo pusiau metodas
def dalijimas_pusiau(func, interval, epsilon):
    l, r = interval
    
    L = r - l
    xm = (l + r) / 2
    fxm = func(xm)

    iter = 0
    fja = 1
    while True:
        iter+=1
        fja+=2

        x1 = l + L / 4
        x2 = r - L / 4
        fx1 = func(x1)
        fx2 = func(x2)

        if fx1 < fxm:
            r = xm
            xm = x1
            fxm = fx1
        elif fx2 < fxm:
            l = xm
            xm = x2
            fxm = fx2
        else:
            l = x1
            r = x2
        L = r - l
        if L < epsilon:
             break
        plt.scatter(xm, f(xm), color='red', alpha=0.5)      
    print("--------DALIJIMO PUSIAU METODAS--------")    
    print ("Dalijimo pusiau metodo iteraciju sk.: ", iter)
    print ("Tikslo funkcijos kvietimu sk.:        ", fja)
    print ("Sprendinys (xm):                      ", xm)
    print ("F-jos minimumo ivertis f(xm):        ", f(xm))
    return xm

# Sukurti x reikšmes nuo 0 iki 10
x_values = np.linspace(0, 4)
# Apskaičiuoti f(x) reikšmes
y_values = f(x_values)

# Nubraižyti grafiką
plt.figure(figsize=(8, 6))
plt.plot(x_values, y_values, label=f'$f(x) = ((x^2 - {a})^2) / {b} - 1$')
plt.title('Tikslo funkcijos $f(x)$ grafikas')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.grid(True)
plt.legend()

# Intervalas ir tikslumas
interval = [0, 10]
epsilon = 1e-4

# Minimizuojame naudodami intervalo dalijimo pusiau metodą
dalijimas_pusiau_min = dalijimas_pusiau(f, interval, epsilon)
plt.scatter(dalijimas_pusiau_min, f(dalijimas_pusiau_min), color='green', label=f'Dalijimo pusiau metodo minimumo t: {dalijimas_pusiau_min:.4f}')

plt.legend()
plt.show()