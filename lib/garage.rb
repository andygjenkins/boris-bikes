require_relative 'van'
require_relative 'bike'


class Garage

  attr_accessor :loading_bay

  def initialize
    @loading_bay = []
    @outward_bound = []
  end

  def fix_bikes
      @loading_bay.each do |bike| bike.repair
       @outward_bound.push(bike)
    end
     @loading_bay = []
  end

  def repair
     bike.broken = false
   end



end
