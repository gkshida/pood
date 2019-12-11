# Template Method Pattern: this technique defines a basic structure in the
# superclass and when we need specializations we send messages to the subclass.
class BicycleWithTemplateMethodPattern
  attr_reader :size, :chain, :tire_size

  # The two methods 'default_chain' and 'default_tire_size' offers a way to
  # provide specializations --> line 31 and 49.
  def initialize(**opts)
    @size = opts[:size]
    @chain = opts[:chain] || default_chain
    @tire_size = opts[:tire_size] || default_tire_size
  end

  def default_chain
    '11-speed'
  end
end

class RoadBike < BicycleWithTemplateMethodPattern
  attr_reader :tape_color

  def initialize(**opts)
    @tape_color = opts[:tape_color]
    super
  end

  def spares
    { chain: '11-speed', tire_size: '23', tape_color: tape_color }
  end

  # This method is called when we need to add a specialization to RoadBike.
  def default_tire_size
    '23'
  end
end

class MountainBike < BicycleWithTemplateMethodPattern
  attr_reader :front_shock, :rear_shock

  def initialize(**opts)
    @front_shock = opts[:front_shock]
    @rear_shock = opts[:rear_shock]
    super
  end

  def spares
    super.merge(front_shock: front_shock)
  end

  # This method is called when we need to add a specialization to MountainBike.
  def default_tire_size
    '2.1'
  end
end

road_bike = RoadBike.new(
  size: 'S',
  tape_color: 'red'
)

puts road_bike.tire_size
puts road_bike.chain

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox'
)

puts mountain_bike.tire_size
puts mountain_bike.chain
