
require_relative "harbor"
require_relative "passenger_ship"
require_relative "cargo_ship"

pearl = Harbor.new("PearlHarbor",1890,2,2,1)
first = PassengerShip.new("Beda", 1992, 10)
second = PassengerShip.new("Pobeda", 1993, 5)
therd = CargoShip.new("Fobos",2001,10)
fourth = CargoShip.new("Deimos", 1900,10)

pearl.get_ship first
pearl.get_ship second
pearl.get_ship therd
pearl.print_info
pearl.print_ships

pearl.del_ship therd
#pearl.loading therd
#pearl.del_ship therd
pearl.print_ships






 
