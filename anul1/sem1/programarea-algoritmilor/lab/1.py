x = int(input("x = "))
y = int(input("y = "))

x = x ^ y
y = x ^ y
x = x ^ y 

print(f"Swapped values x, y = ", x, y)