require_relative 'docking_station'

class Van

  VAN_CAPACITY = 5

  attr_accessor :cargo, :broken_bikes, :van_capacity

  def initialize(capacity = VAN_CAPACITY)
    @cargo = []
    @van_capacity = capacity
  end


  def pick_up(station)
    if station.broken_bikes.count >= 0
      @cargo = station.broken_bikes
      station.broken_bikes = []
      fail 'Van is full' if van_full?
      @cargo

    end
  end


  


  def drop_off(garage)
    garage.loading_bay = @cargo
    @cargo = []
  end



  def van_full?
    @cargo.count >= @van_capacity
  end

end
