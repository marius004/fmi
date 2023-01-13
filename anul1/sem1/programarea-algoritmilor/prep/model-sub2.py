# subiectul 2

# a)
d = {}

for line in open("cinema.in", "r").readlines(): 
  elements = [element.strip() for element in line.strip().split("%")]

  cinema = elements[0]
  film = elements[1]
  ore = set(elements[2].split())

  if d.get(cinema, None) is None: 
    d[cinema] = {film: ore}
  elif d[cinema].get(film, None) is None:
    d[cinema][film] = ore
  else: 
    d[cinema][film] = d[cinema][film].union(ore)

# b)
def sterge_ore(d: dict, cinema, film, ore): 
  if d.get(cinema, None) is not None and d[cinema].get(film, None) is not None: 
    d[cinema][film] -= set(ore)
  return [film for film in d[cinema] if len(d[cinema][film]) > 0]

"""
film = input().strip()
cinema = input().strip()
ora = input().strip()

lst = sterge_ore(d, cinema, film, [ora])
print(lst)
print(d)
""" 

def cinema_film(d, cinemas, ora_minima, ora_maxima): 
  ret =  []

  for cinema in cinemas: 
    for film in d.get(cinema, []):
      ore = [] 
      
      for ora in d[cinema].get(film, set()): 
        if ora >= ora_minima and ora <= ora_maxima:
          ore.append(ora)

      if len(ore) > 0:
        ret.append((film, cinema, ore))

  ret.sort(key=lambda obj: (obj[0], -1 * len(obj[2])))
  return ret 

print(cinema_film(d, ["Cinema 1", "Cinema 2"], "14:00", "22:00"))