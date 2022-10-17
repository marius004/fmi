from math import *  

def countPositiveBits(nr: int) -> int:
    bits = 0
    
    while nr != 0: 
        nr = nr & (nr - 1)
        bits += 1
    
    return bits 

x = int(input("x = "))
k = int(log2(x)) + 1
mask = (1 << k) - 1

print(f"Negative bits: {countPositiveBits(x ^ mask)}")