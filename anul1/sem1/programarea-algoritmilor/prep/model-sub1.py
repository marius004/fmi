# subiectul 1

# a)
def citire_numere(path: str):
  l = []

  for line in open(path, "r").readlines(): 
    l.append([int(x) for x in line.strip().split()])

  return l 

# b)
def prelucrare_lista(l): 
  for i in range(len(l)):
    l[i] = [x for x in l[i] if x != min(l[i])]

  min_len = min([len(x) for x in l])
  for i in range(len(l)):
    l[i] = l[i][:min_len]

# c) 
L = citire_numere("numere.in")
prelucrare_lista(L)

for l in L:
  for el in l: 
    print(el, end=" ")
  print()