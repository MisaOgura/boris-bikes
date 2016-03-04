require_relative 'docking_station'
require_relative 'garage'

class Van
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def pickup(station)
    #raise "There are no broken bikes in this station." if station.bikes.none? {|bike| bike.broken?}
    station.bikes.each {|bike| @bikes << bike if bike.broken?}
    station.bikes.delete_if {|bike| bike.broken?}
    @bikes
  end

  def dropoff(garage)
    @bikes.each do |bike|
      bike.report_broken
      garage.bikes << bike
    end
    @bikes = []
  end

  def collect(garage)
    garage.bikes.each {|bike| @bikes << bike if bike.broken? == false}
    garage.bikes = []
  end

end

# feature test
p broken_bike = Bike.new
broken_bike.report_broken
p broken_bike
van = Van.new
van.bikes << broken_bike
p van.bikes
garage = Garage.new
van.dropoff(garage)
p van.bikes
p garage.bikes
