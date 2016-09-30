require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do

  describe 'pick_up 'do
    it 'picks up the broken bikes' do
    bike = Bike.new
    station = DockingStation.new
    bike.report_broken
    station.dock(bike)
    station.select_bikes
    expect(subject.pick_up(station)).to eq [bike]
    end
  end
end
