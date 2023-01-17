class Coordinate:
    def __init__(self,x,y):
        self.x:int = x
        self.y:int = y
    def __repr__(self):
        return f"Coordinate({self.x},{self.y})"
class City:
    def __init__(self,name:str,location:Coordinate):
        self.name = name
        self.location = location
    def get_name(self):
        return self.name
    def get_location(self):
        return self.location

    def __repr__(self):
        return f"City({self.name},{self.location})"

class country:
    def __init__(self, name:str, capital:City):
        self.name = name
        self.cities = []
        self.capital = capital

    def new_city(self,city:City):
        if city in self.cities:
            raise ValueError("City already exists")
        if not isinstance(city,City):
            raise ValueError("City must be a City object")
        self.cities.append(city)

tokyo = City("Tokyo",location=Coordinate(5,5))
print(tokyo)

hk = City("Hong Kong",location=Coordinate(10,10))

japan = country("Japan",capital=tokyo)

japan.new_city(hk)

