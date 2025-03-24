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

def auksinio_pjuvio(func, interval, epsilon):
  l, r = interval
  tau = (-1 + (5 ** 0.5)) / 2  
  L = r - l
  x1 = r - tau * L
  x2 = l + tau * L
  fx1 = f(x1)
  fx2 = f(x2)

  iter = 0
  fja = 2
  tBandymo = []
  while True:
    iter+=1
    fja+=1
    if fx2 < fx1:
      l = x1
      L = r - l
      x1 = x2
      x2 = l + tau * L
      fx1 = fx2  
      fx2 = f(x2) 
    else:
      r = x2
      L = r - l
      x2 = x1
      x1 = r - tau * L
      fx2 = fx1  
      fx1 = f(x1)  
      if L<epsilon:
         break
    plt.scatter([x1, x2], [f(x1), f(x2)], color='red', alpha=0.5)
  print("--------AUKSINIO PJUVIO METODAS--------")
  print ("Auksinio pjuvio metodo iteraciju sk.: ", iter)
  print ("Tikslo funkcijos kvietimu sk.:        ", fja)
  print ("Sprendinys (xm):                      ", (x1 + x2) / 2)
  print ("F-jos minimumo ivertis f(xm):        ", f((x1 + x2) / 2))

  return (x1 + x2) / 2

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

# Minimizuojame naudodami auksinio pjūvio metodą
auksinio_pjuvio_min = auksinio_pjuvio(f, interval, epsilon)
plt.scatter(auksinio_pjuvio_min, f(auksinio_pjuvio_min), color='green', label=f'Auksinio pjūvio metodo minimumo t: {auksinio_pjuvio_min:.4f}')


plt.legend()
plt.show()
