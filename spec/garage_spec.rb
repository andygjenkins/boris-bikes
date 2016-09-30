require 'van'
require 'garage'

describe Garage do
  describe 'fix_bike' do
    let(:bike) { Bike.new }
    let(:station) { DockingStation.new }
    let(:van) {Van.new}
    it 'repairs the broken bikes' do
      bike.report_broken
      station.dock(bike)
      station.select_bikes
      van.pick_up(station)
      van.drop_off(subject)
      expect(subject.fix_bikes).to eq [bike]
    end
  end
end
