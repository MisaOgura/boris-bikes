require 'docking_station.rb'

describe DockingStation do
  let(:bike) { double :bike }
  it { is_expected.to respond_to(:release_bike) }

  it 'returns a working bike' do
    bike = double('bike', :working? => true)
    subject.dock bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock).with(1).argument }

  describe '#release_bike' do
    it 'raises' do
      station = DockingStation.new
      station.dock double(:is_working => false)
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
        subject.dock bike
      end
      expect { subject.dock bike }.to raise_error('Station is full') if subject.bikes == subject.capacity
    end
  end

  describe '#new' do
    it "Changes the capacity when given a value" do
      station = DockingStation.new(25)
      expect(station.capacity).to eq 25
    end
  end


end
