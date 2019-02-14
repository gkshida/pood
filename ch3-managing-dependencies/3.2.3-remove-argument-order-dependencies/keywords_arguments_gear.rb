class KeywordsArgumentsGear
  attr_reader :chainring, :cog, :wheel

  # Use keywords arguments
  # - 1: This technique avoids positional arguments, ANY ORDER IS ACCEPTED;
  # - 2: It doesn't need a default value;
  # - 3: Each argument ends with a ':';
  # - 4: It traded knowledge of positional arguments to NAMED ARGUMENTS,
  #      a more stable dependency.
  def initialize(chainring:, cog:, wheel:)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
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

# Now the sender of the methods needs to specify the name of the arguments.
puts KeywordsArgumentsGear.new(
                              wheel: Wheel.new(26, 1.5),
                              chainring: 52,
                              cog: 11).gear_inches

# We can use also use a hash to pass the arguments.
puts KeywordsArgumentsGear.new(:chainring => 52,
                               :wheel => Wheel.new(26, 1.5),
                               :cog => 11).gear_inches
