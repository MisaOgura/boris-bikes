class Bike
  attr_accessor :is_working

  def initialize
    @is_working = true
  end

  def working?
    @is_working
  end
end
