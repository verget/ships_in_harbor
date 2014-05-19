require_relative "print_info"
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

