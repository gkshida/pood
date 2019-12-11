class BicycleWithPromotedBehavior
  attr_reader :size, :chain, :tire_size

  # We extract 'chain' and 'tire_size' to be a abstract behavior.
  # All types of bicycles will have these two attributes.
  def initialize(**opts)
    @size = opts[:size]
    @chain = opts[:chain]
    @tire_size = opts[:tire_size]
  end
end

class RoadBike < BicycleWithPromotedBehavior
  attr_reader :tape_color

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

# This method fails because 'Bicycle' doesn't have the 'spares' method.
puts mountain_bike.spares
