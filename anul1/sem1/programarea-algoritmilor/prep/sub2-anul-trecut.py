# subiectul 2

# a)
def citire_matrice(): 
  matrix = []
  for line in open("matrice.in", "r").readlines():
    matrix.append([int(x) for x in line.strip().split()]) 
  return matrix

# b)
def bordare_matrice(matrix):
  for i in range(len(matrix)):
    matrix[i] = matrix[i] + [sum(matrix[i])]
  
  line = []
  for i in range(len(matrix) + 1):
    line_sum = sum([matrix[j][i] for j in range(len(matrix))])
    line.append(line_sum)

  matrix.append(line)

# c)
m = citire_matrice()
bordare_matrice(m)

parcurgeri = [
  [m[i][i] for i in range(len(m))],
  [m[i][len(m) - i - 1] for i in range(len(m))],
  [m[i][j] for i in range(len(m)) for j in range(len(m)) if i != j and j != len(m) - i - 1]
]

with open("matrice.out", "w") as f:
  f.write(" ".join([" ".join([str(x) for x in parcurgere]) for parcurgere in parcurgeri]))