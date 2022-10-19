x = int(input("x = "))
n = int(input("n = "))

left  = x & ((1 << n) - 1)
right = (x >> (n + 1)) & (1 << n - 1)

print(left + right)