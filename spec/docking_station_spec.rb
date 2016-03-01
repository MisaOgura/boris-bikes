require 'docking_station.rb'

describe DockingStation do
  it { is_expected.to respond_to(:release_bike) }

  it 'returns a working bike' do
    subject.dock double(:bike)
    my_bike = subject.release_bike
    expect(my_bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    it 'raises' do
      bike = double(:bike)
      bike.is_working = false
      station = DockingStation.new
      station.dock bike
      expect { station.release_bike }.to raise_error('Cannot release a broken bike')
    end
  end

  it 'raises' do
    if subject.bikes == 0
      expect { subject.release_bike }.to raise_error('Docking station is EMPTY!!!')
    end
  end
  describe '#dock' do
    it 'raises' do
      20.times do
        bike = double(:bike)
        subject.dock bike
      end
      expect { subject.dock double(:bike) }.to raise_error('Station is full') if subject.bikes == subject.capacity
    end
  end

  describe '#new' do
    it "Changes the capacity when given a value" do
      station = DockingStation.new(25)
      expect(station.capacity).to eq 25
    end
  end


end
