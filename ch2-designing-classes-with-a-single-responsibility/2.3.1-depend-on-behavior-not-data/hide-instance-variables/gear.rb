class Gear
  # Wrap instance variables with accessor methods, ruby uses attr_reader.
  # Send messages to access variables, even if you think of them as data.
  attr_reader :chainring, :cog

  def initialize(chainring, cog)
    @chainring = chainring
    @cog = cog
  end

  def ratio
    chainring / cog.to_f
  end
end
