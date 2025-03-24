import numpy as np
import matplotlib.pyplot as plt

studento_nr = "2210350"
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

# Intervalo dalijimo pusiau metodas
def dalijimas_pusiau(func, interval, epsilon):
    l, r = interval
    f = 1
    tBandymo = []
    iter = 0

    xm = (l + r) / 2
    L = r - l
    fxm = func(xm)

    while True:
        iter+=1
        f+=2


        x1 = l + L / 4
        x2 = r - L / 4
        fx1 = func(x1)
        fx2 = func(x2)

        if fx1 < fxm:
            r = xm
            xm = x1
            fxm =fx1
        elif fx2 < fxm:
            l = xm
            xm = x2
            fxm = fx2
        else:
            l = x1
            r = x2
            if L < epsilon:
                break
        tBandymo.append((xm, fxm))
        tBandymo.append((x1, fx1))
        tBandymo.append((x2, fx2))

    print ("Dalijimo pusiau metodo iteraciju sk.: ", iter)
    return xm

def auksinio_pjuvio(func, interval, epsilon):
  l, r = interval
  tau = (-1 + (5 ** 0.5)) / 2  
  L = r - l
  x1 = r - tau * L
  x2 = l + tau * L
  fx1 = func(x1)
  fx2 = func(x2)

  iter = 0
  while True:
    iter+=1
    if fx2 < fx1:
      l = x1
      L = r - l
      x1 = x2
      x2 = l + tau * L
      fx1 = fx2  
      fx2 = func(x2) 
    else:
      r = x2
      L = r - l
      x2 = x1
      x1 = r - tau * L
      fx2 = fx1  
      fx1 = func(x1)  
      if L<epsilon:
         break
  print ("Auksinio pjuvio metodo iteraciju sk.: ", iter)

  return (x1 + x2) / 2

def niutono_metodas(f, df, x0, epsilon):
    iter = 0
    while True:
        iter+=1
        x1 = x0 - df(x0) / dff(x0)
        if abs(x1 - x0) < epsilon:
            break
        x0 = x1
    print("Niutono metodo iteraciju sk. ", iter)
    return x1



# Sukurti x reikšmes nuo 0 iki 10
x_values = np.linspace(0, 10, 400)
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
plt.scatter(dalijimas_pusiau_min, f(dalijimas_pusiau_min), color='red', label=f'Dalijimo pusiau metodo minimumo t: {dalijimas_pusiau_min:.4f}', s=100)

# Minimizuojame naudodami auksinio pjūvio metodą
auksinio_pjuvio_min = auksinio_pjuvio(f, interval, epsilon)
plt.scatter(auksinio_pjuvio_min, f(auksinio_pjuvio_min), color='green', label=f'Auksinio pjūvio metodo minimumo t: {auksinio_pjuvio_min:.4f}')

# Niutono metodas 
x0 = 5
niutiono_metodas_min = niutono_metodas(f, df, x0, epsilon)
plt.scatter(niutiono_metodas_min, f(niutiono_metodas_min), color='blue', label=f'Niutono metodo minimumo t: {niutiono_metodas_min:.4f}')


plt.legend()
plt.show()



