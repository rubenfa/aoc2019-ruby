class Mod
  def initialize(mass)
    @mass = mass
  end

  def needed_fuel
    (@mass/3).round - 2
  end
end
