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

def df(x):
    return 4 * x * (x ** 2 - a) / b

def dff(x):
    return (12 * x ** 2 - 4*a)/b

def niutono_metodas(f, df, x0, epsilon):
    iter = 0
    fja = 0
    while True:
        iter+=1
        fja+=2
        x1 = x0 - df(x0) / dff(x0)
        if abs(x0 - x1) < epsilon:
            break
        x0 = x1
        plt.scatter(x0, f(x0), color='red', alpha=0.5)
    print("------------NIUTONO METODAS------------")
    print("Niutono metodo iteraciju sk.           ", iter)
    print ("Tikslo funkcijos kvietimu sk.:        ", fja)
    print ("Sprendinys (xm):                      ", x1)
    print ("F-jos minimumo ivertis f(xm):        ", f(x1))

    return x1

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

x0 = 5
# Intervalas ir tikslumas
interval = [0, 10]
epsilon = 1e-4

niutiono_metodas_min = niutono_metodas(f, df, x0, epsilon)
plt.scatter(niutiono_metodas_min, f(niutiono_metodas_min), color='green', label=f'Niutono metodo minimumo t: {niutiono_metodas_min:.4f}')


plt.legend()
plt.show()

