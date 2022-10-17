l = list(map(int,input("Enter the numbers : ").strip().split()))

x_xor_y = 0
for el in l:
    x_xor_y = x_xor_y ^ el 
    
print(x_xor_y)