require_relative 'bike'
require 'van'

class DockingStation

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :bike

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
    @broken_bikes = []

  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'Sorry! Bike broken.' if @bikes.last.broken?
    @bikes.pop
  end

  def dock(bike)
    fail 'Docking station full' if full?
    @bikes << bike
  end

def select_bikes
   @bikes.each do |bike|
    if bike.broken?
      @broken_bikes.push(bike)
      @bikes.delete(bike)
    end
  end
  @broken_bikes
end


  private



  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= @capacity
  end



end
