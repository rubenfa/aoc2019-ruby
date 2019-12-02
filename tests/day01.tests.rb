require_relative '../day01.rb'
require 'test/unit'

class TestDay01 < Test::Unit::TestCase
  def test_needed_fuel_mass_12
    mod = Mod.new(12)
   
    assert_equal(2, mod.needed_fuel)
  end

  def test_needed_fuel_mass_14
    mod = Mod.new(14)
    
    assert_equal(2, mod.needed_fuel)
  end

  def test_needed_fuel_mass_1969
    mod = Mod.new(1969)
    
    assert_equal(654, mod.needed_fuel)
  end

  def test_needed_fuel_mass_100756
    mod = Mod.new(100756)
    
    assert_equal(33583, mod.needed_fuel)
  end

  def test_needed_fuel_for_input
    sum = 0
    File.foreach('tests/fixtures/day01_input.txt') {|mass| sum += Mod.new(Integer(mass)).needed_fuel }
    assert_equal(3495189, sum)
  end

end
