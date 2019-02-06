class RevealingReferences
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  # This method now doesn't know about the internal structure of the array.
  # It only knows that the message 'wheels' returns an enumerable and that
  # thing has a rim and a tire.
  def diameters
    wheels.collect { |wheel| wheel.rim + (wheel.tire * 2) }
  end

  # Use the Struct class to wrap a data structure
  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect { |cell| Wheel.new(cell[0], cell[1]) }
  end
end

puts RevealingReferences.new([[622, 20], [622, 23]]).diameters
puts RevealingReferences.new([[559, 30], [559, 40]]).diameters
