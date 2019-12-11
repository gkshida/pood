class Bicycle
  def initialize(**opts)
  end
end

class RoadBikeWithAllBehavior < Bicycle
  # All behavior of Bicycle is in this class
  attr_reader :size, :tape_color

  def initialize(**opts)
    @size = opts[:size]
    @tape_color = opts[:tape_color]
  end

  def spares
    { chain: '11-speed', tire_size: '23', tape_color: tape_color }
  end
end

class MountainBike < Bicycle
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

road_bike = RoadBikeWithAllBehavior.new(
  size: 'S',
  tape_color: 'red')

puts road_bike.size

mountain_bike = MountainBike.new(
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts mountain_bike.size
