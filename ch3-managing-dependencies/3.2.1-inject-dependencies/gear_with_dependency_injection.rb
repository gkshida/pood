class GearWithDependencyInjection
  attr_reader :chainring, :cog, :wheel

  # Dependency Injection
  # - The class only needs an object that responds to a message;
  # - The creation of the new instance is moved outside of this class;
  # - The dependencies are reduced to just a single one, knowing the name
  #   of the message to send other than self.
  # ------------------------------------------------------------------------
  # Gear only needs a object that responds to 'diameter', in this case, the
  # object is named 'wheel', WE DON'T CARE ABOUT THE CLASS.
  def initialize(chainring, cog, wheel)
    @chainring = chainring
    @cog = cog
    @wheel = wheel
  end

  # Instead of creating a new instance of Wheel, now we just call the message
  # 'diameter' from the object 'wheel'.
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

# You can see that the creation of a new instance is outside of Gear.
puts GearWithDependencyInjection.new(52, 11, Wheel.new(26, 1.5)).gear_inches
