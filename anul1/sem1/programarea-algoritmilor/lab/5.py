n = int(input("n = "))

def count_bits(nr) -> int: 
  bits = 0

  while nr:
    nr = nr & (nr - 1)
    bits += 1

  return bits 

print(f"positive bits {count_bits(n)}")