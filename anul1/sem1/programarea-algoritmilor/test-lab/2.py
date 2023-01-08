# a) 
dict = {}
for line in open("cinema.in", "r"):
  formatted = [x.strip() for x in line.split('%')]  
  
  cinema = formatted[0]
  film = formatted[1]
  ore = formatted[2].split()  

  if dict.get(cinema, None) is None: 
    dict[cinema] = {film: set(ore)}
  else: 
    dict[cinema][film] = set(ore)

# b)
def sterge_ore(dict, cinema, film, ore):
  if dict.get(cinema, None) is not None and dict[cinema].get(film, None) is not None: 
    dict[cinema][film] = dict[cinema][film].difference(set(ore))
  
  ret = []
  for cinema in dict:
    for film in dict[cinema]:
      ret.append([cinema, film, list(dict[cinema][film])])

  return ret 
  
# film = input("Film = ").strip()  
# cinema = input("Cinema = ").strip()
# ora = input("Ore = ").strip()

# programari_noi = sterge_ore(dict, cinema, film, [ora])
# print(programari_noi)
# print(dict)

# c) 
def cinema_film(dict, cinematografe, ora_minima, ora_maxima):
  ret = []
  for cinema in cinematografe:
    for film in dict[cinema]:
      ore = []
      for ora in dict[cinema][film]:
        if ora >= ora_minima and ora <= ora_maxima:
          ore.append(ora)
      if len(ore) > 0:
        ret.append((film, cinema, ore))

  ret = sorted(ret, key=lambda obj: len(obj[2]), reverse=True)
  return sorted(ret, key=lambda obj: obj[0])

ret = cinema_film(dict, ["Cinema 1", "Cinema 2"], "14:00", "22:00")
print(ret)