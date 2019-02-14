# Choosing Dependency Direction
# - 1: ALWAYS DEPEND ON THINGS THAT CHANGE LESS THAN YOU DO;
# - 2: PREFER ABSTRACT CLASSES, INTERFACES, OVER CONCRETE CLASSES;
# - 3: ABSTRACT CLASSES CHANGES LESS OFTEN, MAKING THEM GOOD CLASSES TO
#      DEPEND UPON.
class Gear
  attr_reader :chainring, :cog

  def initialize(chainring:, cog:)
    @chainring = chainring
    @cog       = cog
  end

  def gear_inches(diameter)
    ratio * diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

# Reverse Dependencies
# - 1: Wheel now depends on Gear;
class Wheel
  attr_reader :rim, :tire, :gear

  def initialize(rim:, tire:, chainring:, cog:)
    @rim       = rim
    @tire      = tire
    @gear      = Gear.new(chainring: chainring, cog: cog)
  end

  def diameter
    rim + (tire * 2)
  end

  def gear_inches
    gear.gear_inches(diameter)
  end
end

puts Wheel.new(
  rim:       26,
  tire:      1.5,
  chainring: 52,
  cog:       11).gear_inches
