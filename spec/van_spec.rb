require 'docking_station'
require 'bike'
require 'garage'
require 'van'



describe Van do

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
    let(:garage) {Garage.new}
    it 'drops off broken bikes' do
      bike.report_broken
      station.dock(bike)
      station.select_bikes
      subject.pick_up(station)
      subject.drop_off(garage)
      expect(garage.loading_bay).to eq [bike]
   end
  end

  describe 'pick_up_fixed' do
    let(:bike) { Bike.new }
    let(:garage) {Garage.new}
      it 'picks up fixed bikes' do
        garage.outward_bound = [bike]
        subject.pick_up_fixed(garage)
        expect(subject.pick_up_fixed).to eq [bike]
    end
  end








end
