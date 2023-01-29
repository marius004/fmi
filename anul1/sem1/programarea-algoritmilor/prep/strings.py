# da strip la cifrele de la inceput
a = "1235ana are mere01234323232"
cifre = "".join([chr(ord('0') + i) for i in range(10)])
print(a.strip(cifre))


txt = "Hello, welcome to my world."
x = txt.find("welcome")
print(txt[x:])

txt = "Hello, welcome to my world."
x = txt.find("e", 5, 10) # intre pozitia 5 si 10
print(x)