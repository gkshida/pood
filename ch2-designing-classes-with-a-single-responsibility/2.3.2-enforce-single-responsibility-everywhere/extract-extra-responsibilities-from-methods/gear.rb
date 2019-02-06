class Gear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def ratio
    chainring / cog.to_f
  end

  # Extract the method diameter from gear_inches.
  def gear_inches
    ratio * diameter
  end

  # But now, it becomes clear that this method doesn't belong in this class.
  # Gear should not know how to calculate a Wheel diameter
  def diameter
    rim + (tire * 2)
  end
end

puts Gear.new(52, 11, 26, 1.5).gear_inches
puts Gear.new(52, 11, 24, 1.25).gear_inches
