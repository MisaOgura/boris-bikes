require 'docking_station.rb'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it "returns a working bike" do
    station = DockingStation.new
    my_bike = station.release_bike
    expect(my_bike).to be_working
  end

  it "Returns the number of bikes docked" do
    station = DockingStation.new
    bike = station.release_bike
    expect(station.dock(bike)).to eq bike
  end
  it {is_expected.to respond_to(:dock).with(1).argument}
end
