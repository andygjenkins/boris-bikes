require_relative 'docking_station'

class Van
  attr_accessor :cargo, :broken_bikes

  def initialize
    @cargo = []
  end


  def pick_up(station)
    if station.broken_bikes.count >= 0
      @cargo = station.broken_bikes
      station.broken_bikes = []
      @cargo
    end
  end
end
