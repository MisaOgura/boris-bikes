require 'docking_station.rb'

describe DockingStation do
  before do
    @docking_station = DockingStation.new
  end

  it {expect(@docking_station).to respond_to(:release_bike)}

end
