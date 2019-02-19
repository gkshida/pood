class CaseTrip
  attr_reader :bycicles, :customers, :vehicle

  # Hidden Duck 1:
  # - All the prepares must share something in common;
  # - 'What is that this method wants from each of this arguments?';
  # - The answer reveal the Duck.
  def prepare(preparers)
    preparers.each do |prepaper|
      case prepaper
      when Mechanic
        prepaper.prepare_bycicles(bycicles)
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
