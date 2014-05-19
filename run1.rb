module PrintInfo

  attr_accessor :name, :year

  def initialize (name, year)
    @name = name
    @year = year
  end

  def print_info
    puts "#{name} #{year}"
  end

end

class Ship 

  include PrintInfo

  attr_accessor :harbor

  def to_s
    name
  end

  def initialize name, year
    super name, year
    @type = ""
  end

  def come_in_port harbor_name
     @harbor= harbor_name
  end
end

class Harbor

  include PrintInfo

  attr_accessor :cargo_ships,:passenger_ships, :cargo_capacity, :passenger_capacity, :speed

  def initialize name, year, cargo_capacity, passenger_capacity, speed
    super name, year
    @cargo_ships = []
    @passenger_ships = []
    @cargo_capacity = cargo_capacity
    @passenger_capacity = passenger_capacity
    @speed = speed
  end

  def get_ship ship     #zahod korabl9 v port
    send "get_#{ship.type}_ship", ship
  end

  def del_ship ship       #vihod korabl9 iz porta
    if ship.type == "cargo"
      if ship.capacity > 0
        puts "You fool and can't go"
      else   
        @cargo_ships.delete ship
      end
    else
     @passenger_ships.delete ship
    end
  end

  def loading ship        #pogruzka\razgruzka korablei
    if ship.type == "cargo"
      if ship.capacity > 0
        puts "Ships unloading..."
        while ship.capacity > 0
          sleep(@speed) 
          ship.capacity = ship.capacity - 1           
          puts ship.capacity
        end
      else
       puts "Ships loading..."
        while ship.capacity < 10
          sleep(@speed)  
          ship.capacity = ship.capacity  + 1      
          puts ship.capacity
        end
      end
    else 
      puts "It's not a cargo ship"
    end
  end

  def print_ships         #spisok gruzovih i pasagirskih korablei
    puts "Cargo: "+ cargo_ships.join(", ")
    puts "Passengers: " + passenger_ships.join(", ") 
  end
  
private

  def get_cargo_ship ship
    if cargo_capacity > @cargo_ships.count #dlina massiva
       @cargo_ships.push ship
       ship.come_in_port name
     else 
       puts "No cargo places"
     end
  end 
  
  def get_passenger_ship ship
    if passenger_capacity > @passenger_ships.count #dlina massiva
      @passenger_ships.push ship
      ship.come_in_port name
    else 
      puts "No passenger places" 
    end
  end
end

class CargoShip < Ship
  
  attr_accessor :capacity, :type
  
  def initialize (name, year, capacity)
    super name, year
    @type = "cargo"
    @capacity = capacity 
  end
end

class PassengerShip < Ship

  attr_accessor :passengers, :type

  def initialize (name, year, passengers)
    super name, year
    @type = "passenger"
    @passengers = passengers
  end

end

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






 
