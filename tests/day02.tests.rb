require_relative '../day02.rb'
require 'test/unit'

class TestDay02 < Test::Unit::TestCase

  def test_99_alone_ends_program
    assistant = GravityAssistant.new([99])
    assert_equal([99], assistant.calculate_incode())
  end

  def test_stop_the_program_not_more_intodes
    assistant = GravityAssistant.new([3,4,20,99])
    assert_equal([3,4,20,99], assistant.calculate_incode())
  end

  def test_stop_the_program_when_find_a_99
    assistant = GravityAssistant.new([3,4,20,99,1,20])
    assert_equal([3,4,20,99,1,20], assistant.calculate_incode())
  end

  def test_incode_1_should_add_some_codes
    assistant = GravityAssistant.new([1,2,4,3,20,99,1,20])
    assert_equal([1,2,4,24,20,99,1,20], assistant.calculate_incode())
  end

  def test_incode_2_should_calculate_product_some_codes
    assistant = GravityAssistant.new([2,2,4,3,20,99,1,20])
    assert_equal([2,2,4,80,20,99,1,20], assistant.calculate_incode())
  end

  def test_example_input_0
    assistant = GravityAssistant.new([1,9,10,3,2,3,11,0,99,30,40,50])
    assert_equal([3500,9,10,70,2,3,11,0,99,30,40,50], assistant.calculate_incode())
  end

  def test_example_input_1
    assistant = GravityAssistant.new([1,0,0,0,99])
    assert_equal([2,0,0,0,99], assistant.calculate_incode())
  end

  def test_example_input_2
    assistant = GravityAssistant.new([2,3,0,3,99])
    assert_equal([2,3,0,6,99], assistant.calculate_incode())
  end

  def test_example_input_3
    assistant = GravityAssistant.new([2,4,4,5,99,0])
    assert_equal([2,4,4,5,99,9801], assistant.calculate_incode())
  end

  def test_example_input_4
    assistant = GravityAssistant.new([1,1,1,4,99,5,6,0,99])
    assert_equal([30,1,1,4,2,5,6,0,99], assistant.calculate_incode())
  end

  def test_solution
    input = [1,12,2,3,1,1,2,3,1,3,4,3,1,5,0,3,2,1,13,19,2,9,19,23,1,23,6,27,1,13,27,31,1,31,10,35,1,9,35,39,1,39,9,43,2,6,43,47,1,47,5,51,2,10,51,55,1,6,55,59,2,13,59,63,2,13,63,67,1,6,67,71,1,71,5,75,2,75,6,79,1,5,79,83,1,83,6,87,2,10,87,91,1,9,91,95,1,6,95,99,1,99,6,103,2,103,9,107,2,107,10,111,1,5,111,115,1,115,6,119,2,6,119,123,1,10,123,127,1,127,5,131,1,131,2,135,1,135,5,0,99,2,0,14,0]

    assistant = GravityAssistant.new(input)
    result = assistant.calculate_incode()[0]
    assert_equal(result, 7594646)
    puts  "The result to day 02 is #{result}"
  end

end
