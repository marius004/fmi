import math

a = int(input("a = "))
b = int(input("b = "))

def is_prime(n):
  if n % 2 == 0 and n > 2: 
      return False
  return all(n % i for i in range(3, int(math.sqrt(n)) + 1, 2))

for i in range(b, a - 1, -1): 
  if is_prime(i):
    print(f"The biggest prime number between [{a}, {b}] is {i}")
    break
else: 
  print(f"There is no prime number between [{a}, {b}]")