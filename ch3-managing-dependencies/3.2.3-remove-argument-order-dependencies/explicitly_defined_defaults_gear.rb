class ExplicitlyDefinedDefaultsGear
  attr_reader :chainring, :cog, :wheel

  # Explicitly Define Defauls
  # - 1: Add a default value right in the argument list, it turns the
  #      argument into a optional parameter;
  # - 2: If you require a more complex default, pass a method.
  def initialize(chainring: default_chainring, cog: 18, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  def default_chainring
    (100 / 2) - 10
  end

  def gear_inches
    ratio * wheel.diameter
  end

  def ratio
    chainring / cog.to_f
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

puts ExplicitlyDefinedDefaultsGear.new(wheel: Wheel.new(26, 1.5)).chainring

puts ExplicitlyDefinedDefaultsGear.new(:chainring => 52,
                                       :wheel => Wheel.new(26, 1.5)).chainring
