require_relative 'bike'

class DockingStation
  attr_reader :capacity
  def initialize
    @capacity = 20
    @bikes_array = [Bike.new]
    @bike = Bike.new
  end

  def release_bike
    raise 'Docking station is EMPTY!!!' if bikes == 0
    @bike
  end

  def dock(bike)
    raise 'Station is full' if is_full?
    @bikes_array << bike
    bike
  end

  def bikes
    @bikes_array.length
  end

  def is_full?
    bikes == @capacity
  end
end
