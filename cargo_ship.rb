require_relative "ship"
class CargoShip < Ship
  
  attr_accessor :capacity, :type
  
  def initialize (name, year, capacity)
    super name, year
    @type = "cargo"
    @capacity = capacity 
  end
end

