class KindOfIsATrip
  attr_reader :bicycles, :customers, :vehicle

  # Hidden Duck 2:
  # - The same as Case Statement but uses the 'kind_of?' method;
  # - It could use the 'is_a?' method too.
  def prepare(preparers)
    preparers.each do |prepaper|
      if prepaper.kind_of? Mechanic
        prepaper.prepare_bicycles(bicycles)
      elsif prepaper.kind_of? TripCoordinator
        prepaper.buy_food(customers)
      elsif prepaper.kind_of? Driver
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
