class RespondsToTrip
  attr_reader :bicycles, :customers, :vehicle

  # Hidden Duck 3:
  # - Here we use the 'responds_to?' method;
  # - The dependencies are reduced but THEY ARE HIDDEN.
  def prepare(preparers)
    preparers.each do |prepaper|
      if prepaper.responds_to?(:prepare_bicycles)
        prepaper.prepare_bicycles(bicycles)
      elsif prepaper.responds_to?(:buy_food)
        prepaper.buy_food(customers)
      elsif prepaper.responds_to?(:gas_up)
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
