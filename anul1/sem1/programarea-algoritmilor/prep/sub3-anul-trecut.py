# subiectul 3

# a)
d = {}

def insert(d, x1, y1, x2, y2, culoare, label):
  if d.get((x1, y1), None) is None:
    d[(x1, y1)] = {(x2, y2): {culoare: label}}
  elif d[(x1, y1)].get((x2, y2), None) is None: 
    d[(x1, y1)][(x2, y2)] = {culoare: label}
  else:
    d[(x1, y1)][(x2, y2)].update({culoare: label})

for line in open("legaturi.in", "r").readlines(): 
  elements = line.strip().split()
  
  aux = elements[0].split(',')
  x1 = int(aux[0][1:])
  y1 = int(aux[1][:len(aux[1])-1])

  aux = elements[1].split(',')
  x2 = int(aux[0][1:])
  y2 = int(aux[1][:len(aux[1])-1])

  culoare = elements[2]
  label = " ".join(elements[3:])

  # print(x1, y1, x2, y2, culoare, label)

  insert(d, x1, y1, x2, y2, culoare, label)
  insert(d, x2, y2, x1, y1, culoare, label)

# b)

def insereaza_legatura(d: dict, capat1, capat2, culoare, label): 
  if d.get(capat1, {}).get(capat2, {}).get(culoare, {}).get(label, None) is not None:
    return False 
  
  insert(d, capat1[0], capat1[1], capat2[0], capat2[1], culoare, label)
  insert(d, capat2[0], capat2[1], capat1[0], capat1[1], culoare, label)

  return True 

insereaza_legatura(d, (1,3), (2, 7), "negru", "legatura noua")

for capat1 in d: 
  for capat2 in d[capat1]: 
    if capat1 > capat2:
      continue
    for culoare in d[capat1][capat2]:
      print(f"[{capat1[0]},{capat1[1]}] [{capat2[0]},{capat2[1]}] {culoare} {d[capat1][capat2][culoare]}")

def vecini(d, puncte):
  ret = []

  for capat in d: 
    ok = True 

    for p in puncte:
      if d[capat].get(p, None) is None:
        ok = False 
        break 
    
    if ok: 
      ret.append(capat)

  return sorted(ret, key=lambda obj: obj[1], reverse=True)  

print(vecini(d, [(2, 7), (1,3)]))