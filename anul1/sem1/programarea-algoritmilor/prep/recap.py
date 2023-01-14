# recapitulare 

from math import gcd

def ex1(s: str):
  L = s.split(".")
  cifre = "0123456789"

  if len(L) == 1:
    return s

  for i in range(len(L)):
    if i == 0:
      L[i] = L[i].rstrip(cifre)
    elif i == len(L) - 1:
      L[i] = L[i].lstrip(cifre)
    else: 
      L[i] = L[i].strip(cifre)

  return "".join(L)

# print(ex1("Exista 2 constante importante PI = 3.14159265 si e = 2.718281"))
# print(ex1("Ana are 2 mere si 2 pere"))

def ex2(s: str):
  cifre = "0123456789"

  for c in cifre:
    s = s.replace(c, "")

  return s

# print(ex2("Ana are 150 de mere si 500 de banane"))

def ex3(): 
  for line in open("poezie.txt", "r"):
    print(line.strip().center(50)) 

# ex3()

def ex4(s1, s2):
  ret = -1

  for i in range(len(s1)): 
    for j in range(i+1, len(s1)+1): 
      if s1[i:j] in s2:
        ret = max(ret, j - i + 1)

  return ret 
        
# print(ex4("xcdbfffghduiiiisdas", "ghxcdbduiiiisddgs"))

def ex5(propozitie: str):
  for c in "!?": 
    propozitie = propozitie.replace(c, ".")

  l = propozitie.split(".")
  count = len(l)
  max_chr = max([len(el) for el in l])

  return f"Sirul este alcatuit din {count} propozitii. Cea mai lunga propozitie are {max_chr} caractere."

# print(ex5("Ana are mere? Tata are prune! Bunicu face tuica."))

def ex6(n: int):
  return [[1 if gcd(l+1, c+1) == 1 else 0 for c in range(n)] for l in range(n)]

# print(ex6(5))

def ex7(l):
  return "DA" if l == l[::-1] else "NU"

# print(ex7([2,1,3,1,7]))

def ex8(l):
  return max(l)

# print(ex8([[1, 2, 3, 4], [3, 2, 4], [3, 2, 4, 5]]))

def ex9(n: int):

  def is_prime(nr: int): 
    if nr < 2: 
      return False 
    if nr == 2: 
      return True 

    for d in range(2, nr): 
      if nr % d == 0: 
        return False 

    return True

  ret = [] 
  for i in range(2, n):
    if is_prime(i):
      ret.append(i)

  return ret 

# print(ex9(10))

def ex10(l): 
  l.sort(key=lambda x: (x[1], x[0]))

# l = [(1, 2), (2, 1), (2, 3), (1, 3)] 
# ex10(l)
# print(l)

def ex11(l): 
  def is_prime(nr: int): 
    if nr < 2: 
      return False 
    if nr == 2: 
      return True 

    for d in range(2, nr): 
      if nr % d == 0: 
        return False 

    return True

  return [x for x in l if is_prime(x) == False]

# print(ex11([3, 2, 4, 6, 7, 12, 16]))

def ex12(n: int): 
  def a(n: int):
    return 0 if n == 0 else a(n - 1) + 1 / n

  def b(n: int):
    return 1 if n <= 1 else b(n - 1) + b(n - 2)

  def c(n: int):
    return 0 if n == 0 else c(n - 1) + (-1)**n * n 

  first_sum, second_sum, third_sum = 0, 0, 0 
  for i in range(n + 1):
    first_sum  += a(i)
    second_sum += b(i)
    third_sum  += c(i)

  return (first_sum, second_sum, third_sum)

# print(ex12(9))

def ex13(d1, d2): 
  return {k: d1.get(k, 0) + d2.get(k, 0) for k in d1.keys() | d2.keys()}

# print(ex13({'a':1, 'b':2, 'c':2}, {'b': -1, 'c':2,'d':3}))

def ex14(s: str): 
  words = s.lower().split()
  d1 = {word: words.count(word) for word in words}
  d2 = {frq: [x for x in d1 if d1[x] == frq] for frq in d1.values()}

  return d2[max(d2)]

# print(ex14("Ana are mere si mai are si pere Are de asemenea si banane"))

# print(chr(ord('a') + 2))