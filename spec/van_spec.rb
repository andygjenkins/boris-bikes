require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do

# Needs to pick up broken bikes from docking station
=begin
it 'picks up broken bikes' do
  bike = double(:bike, broken?: true)
  station = DockingStation.new
  station.dock(bike)
  expect(subject.pick_up).to eq bike
end

# Needs to deliver broken bikes to garage
=end



end
