class DuckTypedTrip
  attr_reader :bycicles, :customers, :vehicle

  # Trip expects a 'Preparer' argument, a Duck that responds to 'prepare_trip'.
  # This 'Preparer' is an abstract class, an idea.
  def prepare(preparers)
    preparers.each do |prepaper|
      prepaper.prepape_trip(self)
    end
  end
end

# Each 'Preparer' should just implement the 'prepare_trip' method.
# If it comes the time to add an aditional prepare method, the new 'Preparer'
# should just implement 'prepare_trip'.
class Mechanic
  def prepare_trip(trip)
    trip.bycicles.each { |bycicle| prepare_bycicle(bycicle) }
  end

  def prepare_bycicle(bycicle)
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trip.customers)
  end

  def buy_food(customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end

  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end
end
