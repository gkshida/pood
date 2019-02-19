class Trip
  attr_reader :bycicles, :customers, :vehicle

  # This 'mechanic' argument could be of any class.
  # The argument should just respond to the method 'prepare_bycicles'.
  def prepare(mechanic)
    mechanic.prepare_bycicles(bycicles)
  end
end

# If you pass an argument of this type, it works
class Mechanic
  def prepare_bycicles(bycicles)
    bycicles.each { |bycicle| prepare_bycicle(bycicle) }
  end

  def prepare_bycicle(bycicle)

  end
end
