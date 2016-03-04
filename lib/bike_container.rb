module BikeContainer
DEFAULT_CAPACITY = 20
attr_accessor :capacity
attr_reader :bikes

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def load_bikes source
    @bikes = source.bikes
    source.remove_bikes(@bikes)
    @bikes
  end

  def remove_bikes bike_array
    @bikes -= bike_array
  end
end
