class Van

  attr_accessor :cargo

  def initialize
    @cargo = []
  end

  def pick_up
    @bikes.each do |bike|
      if bike.broken?
        @cargo << bike
        @bikes.delete bike
      end
    end
  end




end
