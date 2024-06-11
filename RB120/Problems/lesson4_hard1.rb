 #1. Ben and Alyssa are working on a vehicle management system. So far, they have created classes called Auto and Motorcycle
   # to represent automobiles and motorcycles. After having noticed common information and calculations they were performing
   # for each type of vehicle, they decided to break out the commonality into a separate class called WheeledVehicle.
   # This is what their code looks like so far:

  #2. Building on the prior vehicles question, we now must also track a basic motorboat. A motorboat has a single propeller and hull,
   # but otherwise behaves similar to a catamaran. Therefore, creators of Motorboat instances don't need to specify number of hulls or
   # propellers. How would you modify the vehicles code to incorporate a new Motorboat class?

  #3. The designers of the vehicle management system now want to make an adjustment for how the range of vehicles is calculated.
    # For the seaborne vehicles, due to prevailing ocean currents, they want to add an additional 10km of range even if the vehicle is out of fuel.
    # Alter the code related to vehicles so that the range for autos and motorcycles is still calculated as before, but
    # for catamarans and motorboats, the range method will return an additional 10km.

 module FuelCalculations
  attr_accessor :fuel_capacity, :fuel_efficiency

  def range
   @fuel_capacity * @fuel_efficiency

  end
 end

  class WheeledVehicle
    include FuelCalculations
    attr_accessor :speed, :heading

    def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
      @tires = tire_array
      self.fuel_capacity = km_traveled_per_liter
      self.fuel_efficiency = liters_of_fuel_capacity
    end

    def tire_pressure(tire_index)
      @tires[tire_index]
    end

    def inflate_tire(tire_index, pressure)
      @tires[tire_index] = pressure
    end

    #def range
     # @fuel_capacity * @fuel_efficiency
    #end
  end

  class Auto < WheeledVehicle

    def initialize
      # 4 tires are various tire pressures
      super([30,30,32,32], 50, 25.0)
    end
  end

  class Motorcycle < WheeledVehicle

    def initialize
      # 2 tires are various tire pressures
      super([20,20], 80, 8.0)
    end

  end

  class Boat
    include FuelCalculations
    attr_reader :propeller_count, :hull_count
    attr_accessor :speed, :heading

    def initialize(num_propellers,  num_hulls,  km_traveled_per_liter, liters_of_fuel_capacity)
      self.fuel_capacity = km_traveled_per_liter
      self.fuel_efficiency = liters_of_fuel_capacity
      @propeller_count = num_propellers
      @num_hulls = num_hulls
    end

    def range
      super + 10
    end

  end

  class Motorboat < Boat

    def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
      super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
    end

  end

  class Catamaran < Boat

  end


# This new class does not fit well with the object hierarchy defined so far. Catamarans don't have tires.
# But we still want common code to track fuel efficiency and range. Modify the class definitions and move code into a Module,
# as necessary, to share code among the Catamaran and the wheeled vehicles.

# 1. Resolution
#. We have established that tires and all similar behaviors is unique to the Auto Class and it's subclasses. So this means there is no need to
# extrapolate this data to a module. However we want our fuel related calculations to be availabale for all classes. This intention is a clear sign
# of a needed module to mixin. So we create the FuelCalculations module. Here want to have two instance_variables @fuel_capacity and @fuel_efficiency
# these will be instantiated in each class that are mixed in. We then in the module create the method range which will multiply the values of the
# two instance variables.
# in each class set each fuel parameter to the result of invoking the fuel_capacity and fuel_efficiency on self respectively.
# now we can access the fuel_capacity, fuel_efficiency, and range of all 3 classes effectively.

motor = Motorboat.new(80, 8)

bike = Motorcycle.new

cata = Catamaran.new(2, 4, 80, 8)
 cata.propeller_count
 p bike.range
 p cata.range
 p motor.range
