class ObscuringReferences
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # 0 is rim, 1 is tire.
  # This method DEPENDS upon the array's structure, so if the structure
  # changes, then this code must change.
  def diameters
    data.collect { |cell| cell[0] + (cell[1] * 2) }
  end
end

puts ObscuringReferences.new([[622, 20], [622, 23]]).diameters
puts ObscuringReferences.new([[559, 30], [559, 40]]).diameters
