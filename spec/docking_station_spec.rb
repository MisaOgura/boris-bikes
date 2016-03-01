require 'docking_station.rb'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  before do
    @docking_station = DockingStation.new
    @bike = @docking_station.release_bike
  end

  it "returns a bike" do
    expect(@bike.class).to eq("Bike")
  end

end
