# a)
def divizori(*numbers): 
    ret = {}

    def is_prime(num):  
        if num == 2:
            return True
        if num < 2 or num % 2 == 0:
            return False 
        for d in range(3, num, 2): 
            if num % d == 0: 
                return False 
        return True 

    for number in numbers: 
        divisors = [] 
        for d in range(2, number): 
            if number % d == 0 and is_prime(d): 
                divisors.append(d) 
        ret[number] = divisors 

    return ret

print(divizori(50, 21, 121))

# b) 
litere_10 = [chr(ord('a') + i) for i in range(10)]
print(litere_10)
