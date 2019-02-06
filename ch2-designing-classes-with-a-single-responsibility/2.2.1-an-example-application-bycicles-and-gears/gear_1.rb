class Gear1
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end

puts Gear1.new(52, 11).ratio
puts Gear1.new(52, 11).ratio
