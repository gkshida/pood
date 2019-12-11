class Trip
  attr_reader :bicycles, :customers, :vehicle

  # This 'mechanic' argument could be of any class.
  # The argument should just respond to the method 'prepare_bicycles'.
  def prepare(mechanic)
    mechanic.prepare_bicycles(bicycles)
  end
end

# If you pass an argument of this type, it works
class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)

  end
end
