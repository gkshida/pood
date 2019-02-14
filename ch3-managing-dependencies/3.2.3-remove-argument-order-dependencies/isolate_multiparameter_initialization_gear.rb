# Isolate Multiparameter Initialization
# - 1: This is situation where YOU DON'T CONTROL THE METHOD;
# - 2: Your application should DEPEND ON THINGS YOU OWN;
# - 3: Wrap the method to isolate the dependencies;
# - 4: This is technique to replace positional arguments to keywords.

# This module is not owned by you
module SomeFramework
  class Gear
    attr_reader :chainring, :cog, :wheel

    def initialize(chainring, cog, wheel)
      @chainring = chainring
      @cog       = cog
      @wheel     = wheel
    end

    def gear_inches
      ratio * wheel.diameter
    end

    def ratio
      chainring / cog.to_f
    end
  end
end

# This is a wrapper module:
# - 1: It avoids the dependency of knowing the order of arguments;
# - 2: It isolates all the knowledge of an external interface in one place;
# - 3: It should not be instantiated SO IT SHOULD NOT BE INCLUDED IN A CLASS.
# OBS.: This module is particular is a Factory, it just creates instances of
# other classes.
module IsolateMultiparameterInitializationGear
  def self.gear(chainring:, cog:, wheel:)
    SomeFramework::Gear.new(chainring, cog, wheel)
  end
end

class Wheel
  attr_reader :rim, :tire

  def initialize(rim, tire)
    @rim  = rim
    @tire = tire
  end

  def diameter
    rim + (tire * 2)
  end
end

puts IsolateMultiparameterInitializationGear.gear(
  chainring: 52,
  cog:       11,
  wheel:     Wheel.new(26, 1.5)).gear_inches
