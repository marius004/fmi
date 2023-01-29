# sets 
s = set(["apple", "banana", "cherry"])

if "apple" in s: 
  pass 

for el in s: 
  pass 

s.add("orange")
s.update(["ana", "are", "mere"])
# print(s)

if "apples" in s: 
  s.remove("apples") # raises an error if apples is not in the set 

s.discard("apples") # does not raise an error if the element is not in the set 

# delete the set completely
# del s 

set1 = {"a", "b", "c"}
set2 = {1, 2, "a"}

# print(set1.union(set2)) # {1, 2, 'b', 'c', 'a'}

set1 = {"a", "b" , "c"}
set2 = {1, 2, 3}

set1.update(set2) # {1, 2, 3, 'b', 'a', 'c'}
print(set1)

x = {"apple", "banana", "cherry"}
y = {"google", "microsoft", "apple"}

# print(x.intersection(y))
# same as update but takes only the elements in both sets
# x.intersection_update(y) 

x = {"apple", "banana", "cherry"}
y = {"google", "microsoft", "apple"}

# elements that are not present in neither sets 
x.symmetric_difference_update(y)
# print(x)

x = {"12:30", "14:15", "17:00"}
y = {"12:30", "19:25"}

# when using "|", "&", "-" operators 
# both x and y need to be sets 
print(x | y) # union 
print(x & y) # intersection 
print(x - y) # difference 
print(x ^ y) # symetric difference 
#  x ^ y return the set of all elements 
# in either x or y, but not both

# x.isdisjoint(y)
# x.clear()

# https://realpython.com/python-sets/