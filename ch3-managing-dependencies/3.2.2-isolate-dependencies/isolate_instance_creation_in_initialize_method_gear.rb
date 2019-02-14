class IsolateInstanceCreationInInitializeMethodGear
  attr_reader :chainring, :cog, :wheel

  # - Should be used when you can't change the dependency of knowing the class
  # name;
  # - This explicitly expose the dependency;
  # - The creation of a new instance is moved to the initialize method;
  # - Everytime a new instance of the class will be created.
  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @wheel = Wheel.new(rim, tire)
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

puts IsolateInstanceCreationInInitializeMethodGear.new(52, 11, 26, 1.5).gear_inches
