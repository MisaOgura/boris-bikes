require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize
    @capacity = DEFAULT_CAPACITY
    @bikes_array = [Bike.new]
    @bike = Bike.new
  end

  def release_bike
    raise 'Docking station is EMPTY!!!' if empty?
    @bike
  end

  def dock(bike)
    raise 'Station is full' if full?
    @bikes_array << bike
    bike
  end

  def bikes
    @bikes_array.length
  end

private

  def full?
    bikes == @capacity
  end

  def empty?
    bikes == 0
  end

end
