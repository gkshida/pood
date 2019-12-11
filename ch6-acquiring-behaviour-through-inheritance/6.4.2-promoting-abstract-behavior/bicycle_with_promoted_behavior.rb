# This class has a common behavior with the addition of 'size'.
# Promoting behavior is less dangerous than pushing it down.
class BicycleWithPromotedBehavior
  attr_reader :size

  def initialize(**opts)
    @size = opts[:size]
  end
end

class RoadBike < BicycleWithPromotedBehavior
  attr_reader :tape_color

  # To delegate to a superclass, we MUST use 'super'
  def initialize(**opts)
    @tape_color = opts[:tape_color]
    super
  end

  def spares
    { chain: '11-speed', tire_size: '23', tape_color: tape_color }
  end
end

class MountainBike < BicycleWithPromotedBehavior
  attr_reader :front_shock, :rear_shock

  # 'super' passes the message up to the superclass.
  def initialize(**opts)
    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]
    super
  end

  def spares
    super.merge(front_shock: front_shock)
  end
end

road_bike = RoadBike.new(
  size: 'S',
  tape_color: 'red')

puts road_bike.size

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.size
