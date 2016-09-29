require_relative 'bike'

class DockingStation

  attr_reader :bike

  def initialize
    @bikes = []
    @capacity = 20
  end

  def release_bike
    fail 'No bikes available' if empty?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= @capacity
  end

end
