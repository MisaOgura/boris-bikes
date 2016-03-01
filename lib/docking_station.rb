require_relative "bike"

class DockingStation
  def initialize
    @bikes = []
  end
  def release_bike
    Bike.new
  end
  def dock bike
    @bikes << bike
    bike
  end
  def bikes
    @bikes.length
  end
end
