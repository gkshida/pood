# Notice that this class starts to have more than one responsibility,
# it handles a road or a mountain bike.
# - We handle that by adding the ':style' property;
# - This creates a problem, everytime we use this class, the style must be
#   checked.
class RoadAndMountainBicycle
  attr_reader :style, :size, :tape_color, :front_shock, :rear_shock

  def initialize(**opts)
    @style       = opts[:style]
    @size        = opts[:size]
    @tape_color  = opts[:tape_color]
    @front_shock = opts[:front_shock]
    @rear_shock  = opts[:rear_shock]
  end

  # The 'if' statement doesn't only check the style: IT CHECKS AN ATTRIBUTE
  # THAT HOLDS A CATEGORY OF SELF!
  # --> THIS IS SAME AS KNOWING THE CLASS OF AN OBJECT: A DEPENDENCY.
  def spares
    if style == :road
      { chain: '11-speed', tire_size: '23', tape_color: tape_color }
    else
      { chain: '11-speed', tire_size: '2.1', front_shock: front_shock }
    end
  end
end

bike = RoadAndMountainBicycle.new(
  style: :mountain,
  size: 'S',
  front_shock: 'Manitou',
  rear_shock: 'Fox')

puts bike.spares

bike = RoadAndMountainBicycle.new(
  style: :road,
  size: 'M',
  tape_color: 'red')

puts bike.spares
