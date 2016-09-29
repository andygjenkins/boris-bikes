require 'docking_station'

describe DockingStation do
  # it { is_expected.to respond_to(:bike) }

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it { is_expected.to respond_to :release_bike }

  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end


  describe 'initialization' do
    subject {DockingStation.new}
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      # We want to release the bike we docked
      expect(subject.release_bike).to eq bike
    end
    it 'raises an error when there are no bikes available' do
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'fails if bike broken' do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect {subject.release_bike}.to raise_error 'Sorry! Bike broken.'
    end



  end

  describe 'dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
    end





end
