from math import *

a = int(input("a = "))
b = int(input("b = "))
c = int(input("c = "))

delta = b**2 - 4*a*c 

if delta == 0:
  rad = -b/2*a
  print("Radacina {rad}")
elif delta > 0:
  rad1 = (-b + sqrt(delta)) / 2 * a
  rad2 = (-b - sqrt(delta)) / 2 * a
  print("Radacinile sunt {rad1}, {rad2}")
else: 
  print("Nu exista solutii reala")
