n = int(input("n = "))

for i in range((1 << n)):
  l = []
  for j in range(5): # n <= 10
    if i & (1 << j):
      l.append(j + 1)
  print(l)
