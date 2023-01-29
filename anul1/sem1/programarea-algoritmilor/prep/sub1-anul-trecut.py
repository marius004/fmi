# subiectul 1

d = {}
for line in open("numere1.in").readlines(): 
  numbers = [int(x) for x in line.strip().split()]

  num_sum = sum(numbers)
  if d.get(num_sum, None) is None: 
    d[num_sum] = [numbers] 
  else: 
    d[num_sum] = d[num_sum] + [numbers]

with open("numere1.out", "w") as f: 
  for key in sorted(d.keys()):
    f.write(f"Suma {key}:\n")
    
    for l in sorted(d[key], key=lambda obj: -1 * len(obj)):
      f.write(" ".join([str(x) for x in l]) + "\n")
      