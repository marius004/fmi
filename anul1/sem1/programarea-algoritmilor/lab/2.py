from math import *

n = int(input("n = "))

if not n & (n - 1):
  print(f"{n} is 2^{int(log2(n))}")
else: 
  print(f"{n} cannot be written 2**k")