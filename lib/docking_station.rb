require_relative "bike"

class DockingStation

  def initialize
    @bikes_array = [Bike.new]
    @bike = Bike.new
  end

  def release_bike
    raise "Docking station is EMPTY!!!" if self.bikes == 0
    @bike
  end

  def dock bike
    @bikes_array << bike
    bike
  end
  def bikes
    @bikes_array.length
  end
end
