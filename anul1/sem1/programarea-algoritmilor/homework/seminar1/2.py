l = list(map(int,input("Enter the numbers : ").strip().split()))

ans = 0 if len(l) == 0 or len(l) >= 2 else l[0]
print(ans)
