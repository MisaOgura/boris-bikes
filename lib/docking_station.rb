require_relative 'bike'
class DockingStation
  DEFAULT_CAPACITY = 20

  attr_accessor :bikes, :capacity
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if empty?
    unless @bikes.last.working? then raise('No bikes working')
    else @bikes.pop
    end
  end

  def dock(bike)
    raise 'Docking station full' if full?
    @bikes << bike
  end

  #def release_broken_bikes
  #  @bikes.reject {|bike| bike.working?}
  #end

  private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end
