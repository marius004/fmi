thisdict = {
  "brand": "Ford",
  "model": "Mustang",
  "year": 1964,
  "ceva": [1,2,3,4,5]
}

# keys 
print(thisdict.keys())
print(thisdict.keys() | {'mere'})

# values 
print(thisdict.values())

# items 
print(thisdict.items())

thisdict["year"] = 2018
thisdict.update({"year": 2020}) # the argument must be a dictionary 

# del thisdict["ceva"]
thisdict.pop("ceva")
print(thisdict)

# thisdict.clear()

# how to copy a dictionary 
d2 = thisdict.copy()
d3 = dict(thisdict)

d = {'a': 10, 'b': 20, 'c': 30}
d.popitem() # remove the last inserted value ('c', 30)

# d1.update(d2), d1, d2 dict type

# dictionary comprehension

# a)
names = ['Mariya', 'Gendalf', 'Batman']
profs = ['programmer', 'wizard', 'superhero']

print({key: value for (key, value) in zip(names, profs)})

# b)
my_dict = {
  "Spider": "photographer",
  "Bat": "philanthropist",
  "Wonder Wo": "nurse"
}

print({key + "man": value for (key, value) in my_dict.items()})

import string

keys = ["id", "username", "password"]
users = ["mariyasha888", "knotAbot"]
data = [{key: (i if key == "id" else users[i] if key == "username" else string.printable[i*3:i*3+5]) for key in keys} for i in range(len(users))]

print(data)