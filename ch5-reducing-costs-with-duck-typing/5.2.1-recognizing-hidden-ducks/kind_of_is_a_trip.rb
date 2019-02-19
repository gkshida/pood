class KindOfIsATrip
  attr_reader :bycicles, :customers, :vehicle

  # Hidden Duck 2:
  # - The same as Case Statement but uses the 'kind_of?' method;
  # - It could use the 'is_a?' method too.
  def prepare(preparers)
    preparers.each do |prepaper|
      if prepaper.kind_of? Mechanic
        prepaper.prepare_bycicles(bycicles)
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
  def prepare_bycicles(bycicles)
    bycicles.each { |bycicle| prepare_bycicle(bycicle) }
  end

  def prepare_bycicle(bycicle)
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
