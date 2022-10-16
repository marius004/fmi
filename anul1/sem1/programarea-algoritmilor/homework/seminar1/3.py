x = int(input("x = "))
y = int(input("y = "))

def countPositiveBits(nr: int) -> int:
    bits = 0
    
    while nr != 0: 
        nr = nr & (nr - 1);
        bits += 1
    
    return bits 

x_xor_y = x ^ y
print(f"Solution: {countPositiveBits(x_xor_y)}")