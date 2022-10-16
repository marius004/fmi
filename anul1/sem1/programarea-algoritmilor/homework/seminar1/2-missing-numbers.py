"""
Se citesc n - 2 numere naturale distincte dintre primele n numere naturale nenule. Să
se afișeze numerele lipsă x și y.
"""

n = int(input("n = "))
l = list(map(int,input("Enter the numbers : ").strip().split()))[:n-2]

x_xor_y = 0
for i in range(1, n + 1):
    x_xor_y = x_xor_y ^ i

for el in l: 
    x_xor_y = x_xor_y ^ el
    
p = x_xor_y & ~(x_xor_y - 1)

x = 0
for i in range (1, n + 1): 
    if i & p == 0:
        x = x ^ i

for el in l: 
    if el & p == 0: 
        x = x ^ el 
        
y = x_xor_y ^ x
if x > y:
    y, x = x, y

print(f"Solution x = {x} and y = {y}")