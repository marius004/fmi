from math import *

l = list(map(float,input("Enter the numbers : ").strip().split()))

max_increase = 0
days = [-1, -1]
for i in range(1, len(l)):
  diff = abs(l[i] - l[i - 1])
  if diff > max_increase:
    max_increase = diff
    days = [i - 1, i]

diff = abs(l[0] - l[len(l) - 1])
if diff > max_increase: 
  max_increase = diff 
  days = [0, len(l) - 1]

print(f"Cea mai mare crestere {round(max_increase, 2)} in zilele {days[0]} si {days[1]}")