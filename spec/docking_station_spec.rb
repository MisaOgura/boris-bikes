require 'docking_station.rb'

describe DockingStation do

  it {is_expected.to respond_to(:release_bike)}

  it "returns a working bike" do
    my_bike = subject.release_bike
    expect(my_bike).to be_working
  end

  it "Returns the number of bikes docked" do
    bike = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it "raises" do
    if subject.bikes == 0
      expect {subject.release_bike}.to raise_error("Docking station is EMPTY!!!")
    end
  end

end
