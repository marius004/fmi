def number_generator(): 
    i = 0

    while True: 
        yield i
        i += 1 

gen = number_generator()
for i in gen:
    if i == 100: 
        break
    print(i)

#gen.close()
