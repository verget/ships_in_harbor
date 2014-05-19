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

