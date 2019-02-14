class IsolateInstanceCreationInExplicitMethodGear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    ratio * wheel.diameter
  end

  # - Should be used when you can't change the dependency of knowing the class
  # name;
  # - This explicitly expose the dependency;
  # - The creation of a new instance is moved to a explicit defined method;
  # - The creation of a new instance is deferred until the method is called.
  def wheel
    @wheel ||= Wheel.new(rim, tire)
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

puts IsolateInstanceCreationInExplicitMethodGear.new(52, 11, 26, 1.5).gear_inches
