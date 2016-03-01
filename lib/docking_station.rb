require_relative 'bike'

class DockingStation
  attr_reader :capacity
  DEFAULT_CAPACITY = 20
  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes_array = []
  end

  def release_bike
    raise 'Docking station is EMPTY!!!' if empty?
    raise 'Cannot release a broken bike' unless @bikes_array.last.is_working
    @bike = @bikes_array.pop
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
