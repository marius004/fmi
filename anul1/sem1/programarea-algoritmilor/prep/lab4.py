def cautare(x, L, cmpValori):
  for i in range(len(L) - 1, -1, -1):
    if cmpValori(L[i], x): 
      return i 
  
  return -1 

def f():
  global x
  x = x + 100
  print(f"x = {x}")

def suma(*args, maxi): 
  return sum([x for x in args if x < maxi])

def f2():
  n = 100

  def aux():
    nonlocal n
    n = n * 2

  aux() 
  return n

x = 0
print(suma(1,2,3,4,6,7,8,9, maxi=6))
print(cautare(6, [1,2,3,4,5,6,7,8], lambda x,y: x == y))
f()
f2()