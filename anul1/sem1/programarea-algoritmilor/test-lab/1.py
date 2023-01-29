# a)
def citire_numere(path):
  lists = []

  for line in open(path, "r"):
    lists.append([int(x) for x in line.strip().split()])
    
  return lists 

# b)
def prelucrare_lista(lists): 
  for i in range(len(lists)): 
    list_min = min(lists[i])
    lists[i] = [x for x in lists[i] if x != list_min]

  min_sublist_len = min([len(l) for l in lists])
  for i in range(len(lists)):
    lists[i] = lists[i][:min_sublist_len]

# c)
lists = citire_numere("numere.txt")
prelucrare_lista(lists)

for l in lists: 
  for element in l: 
    print(element, end=' ')
  print()

# d) 
k = int(input())
lists = citire_numere("numere.txt")

with open("cifre.out", "w") as f: 
  numbers = []
  for l in lists: 
    for element in l: 
      if len(str(element)) == k: 
        numbers.append(element)

  numbers = sorted(set(numbers), reverse=True)
  
  if len(numbers) > 0:
    f.write(" ".join([str(x) for x in numbers]))
  else:
    f.write("Imposibil")