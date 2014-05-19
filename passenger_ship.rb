require_relative "ship"
class PassengerShip < Ship

  attr_accessor :passengers, :type

  def initialize (name, year, passengers)
    super name, year
    @type = "passenger"
    @passengers = passengers
  end

end
