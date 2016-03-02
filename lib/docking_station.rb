require_relative "bike"

class DockingStation
  attr_reader :bikes
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    raise "There are no bikes left" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "The docking station is full" if full?
    @bikes << bike
    bike
  end

  private

  def full?
    @bikes.size >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.size == 0
  end

end
