class TightlyCoupledGear
  attr_reader :chainring, :cog, :rim, :tire

  def initialize(chainring, cog, rim, tire)
    @chainring = chainring
    @cog = cog
    @rim = rim
    @tire = tire
  end

  def gear_inches
    # Dependencies
    # - 1: Knowing the name of another class;
    #   Gear expects a class named Wheel to exist.
    # - 2: Knowing the name of a message that intends to send other than self;
    #   Gear expects Wheel to respond to diameter method
    # - 3: Knowing the arguments the message requires.
    #   Gear knows that Wheel.new require rim and tire;
    # - 4: Knowing the order of the arguments.
    #   Gear knows that the first argument is rim and second is tire.
    ratio * Wheel.new(rim, tire).diameter
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

puts TightlyCoupledGear.new(52, 11, 26, 1.5).gear_inches
