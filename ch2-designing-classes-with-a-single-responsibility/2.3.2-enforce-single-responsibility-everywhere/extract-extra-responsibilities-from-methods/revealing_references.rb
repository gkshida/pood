class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # First iterate over the array
  def diameters
    wheels.collect { |wheel| diameter(wheel) }
  end

  # Second calculate diameter of one wheel
  def diameter(wheel)
    wheel.rim + (wheel.tire * 2)
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end

puts RevealingReferences.new([[622, 20], [622, 23]]).diameters
puts RevealingReferences.new([[559, 30], [559, 40]]).diameters
