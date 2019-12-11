class ComplicatedTrip
  attr_reader :bicycles, :customers, :vehicle

  # With the addition of new requirements, this class starts to look bad:
  # - 1: It knows the name of three classes: Mechanic, TripCoordinator and
  #      Driver;
  # - 2: It knows the methods that each class has;
  # - 3: It knows the arguments of each message.
  def prepare(preparers)
    preparers.each do |prepaper|
      case prepaper
      when Mechanic
        prepaper.prepare_bicycles(bicycles)
      when TripCoordinator
        prepaper.buy_food(customers)
      when Driver
        prepaper.gas_up(vehicle)
        preparer.fill_water_tank(vehicle)
      end
    end
  end
end

class Mechanic
  def prepare_bicycles(bicycles)
    bicycles.each { |bicycle| prepare_bicycle(bicycle) }
  end

  def prepare_bicycle(bicycle)
  end
end

class TripCoordinator
  def buy_food(customers)
  end
end

class Driver
  def gas_up(vehicle)
  end

  def fill_water_tank(vehicle)
  end
end
