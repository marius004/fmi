from math import *

l1 = int(input("L1 = "))
l2 = int(input("L2 = "))

latura = gcd(l1, l2)
placi  = int((l1 * l2) / latura**2)
print(latura, placi)