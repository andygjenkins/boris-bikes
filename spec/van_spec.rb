require 'docking_station'
require 'bike'
require 'garage'
require 'van'

describe Van do

  describe 'initialization' do
    subject {Van.new}
    station = DockingStation.new
    bike = Bike.new.report_broken
    it 'defaults capacity' do
      described_class::VAN_CAPACITY.times do
        subject.pick_up(station)

      end
     expect { subject.pick_up(station) }.to raise_error 'Van is full'

   end
 end

  it 'has a default capacity' do
    expect(subject.van_capacity).to eq described_class::VAN_CAPACITY
  end

  describe 'pick_up 'do
   let(:bike) { Bike.new }
   let(:station) { DockingStation.new }
      it 'picks up the broken bikes' do
      bike.report_broken
      station.dock(bike)
      station.select_bikes
      expect(subject.pick_up(station)).to eq [bike]
    end
  end

  describe 'drop_off' do
    let(:bike) { Bike.new }
    let(:station) { DockingStation.new }
    it 'drops off broken bikes' do
    station.dock(bike)
    station.select_bikes
    subject.pick_up(station)
    expect(subject.drop_off).to eq [bike]
   end
  end
end
