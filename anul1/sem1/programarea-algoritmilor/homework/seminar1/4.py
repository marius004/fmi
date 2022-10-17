from math import *

def nextPowerOf2(nr: int) -> int: 
    if not nr & (nr - 1):
        return nr 
    
    x = int(log2(nr)) + 1
    return (1 << x)

x = int(input("x = "))
print(f"Solution: {nextPowerOf2(x)}")
    