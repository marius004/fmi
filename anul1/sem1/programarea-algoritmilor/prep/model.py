# Subiectul 1)

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

# print(divizori(50, 21, 121))

# b) 
litere_10 = [chr(ord('a') + i) for i in range(10)]
# print(litere_10)

# c)
# O(log3(n))

# Subiectul 2)
def planificare_spectacole(timpi): 
    arr = [(i, timpi[i][0], timpi[i][1]) for i in range(len(timpi))]
    arr.sort(key=lambda obj: obj[3])

    counter = 1
    last_spectacol = arr[0]

    for spectacol in arr[1:]: 
        if spectacol[1] >= last_spectacol[2]: 
            last_spectacol = spectacol
            counter += 1

    return counter 

# Subiectul 3)
def subsir_crescator(list): 
    dp = [1] * len(list)
    tree = [-1] * len(list) 

    for i in range(len(list)):
        for j in range(0, i): 
            if list[i] >= list[j] and dp[i] < dp[j] + 1: 
                dp[i] = dp[j] + 1
                tree[i] = j 

    max_index = 0
    for i in range(1, len(list)): 
        if dp[max_index] < dp[i]:
            max_index = i 
    
    ret = []
    j = max_index

    while j != -1: 
        ret.append(list[j])
        j = tree[j]

    ret.reverse()
    return ret 

# print(subsir_crescator([3,10,2,11]))

# Subiectul 4)
def permutari(n):
    list = [0] * n 
    freq = [False] * (n + 1) 

    def generare_permutari(pos=0):
        if pos == n: 
            for i in list: 
                print(i, end=" ")
            print() 
            return 

        for i in range(1, n + 1): 
            list[pos] = i 
            if freq[i] == False:
                freq[i] = True 
                generare_permutari(pos + 1)
                freq[i] = False 

    generare_permutari() 

# permutari(4)