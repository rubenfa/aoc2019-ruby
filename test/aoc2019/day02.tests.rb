require_relative '../../lib/aoc2019/day02.rb'
require_relative '../../lib/aoc2019/io_utilities.rb'
require 'test/unit'

class TestDay02 < Test::Unit::TestCase

  include ListLoader

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
    input = read_list_from_file('../aoc2019/fixtures/day02_input.txt')
    input[1] = 12
    input[2] = 2

    assistant = GravityAssistant.new(input)
    result = assistant.calculate_incode()[0]
    assert_equal(result, 7594646)
    puts  "The result to day 02 is #{result}"
  end

  def test_easy_reverse
    input = read_list_from_file('../aoc2019/fixtures/day02_input.txt')

    reverse = ReverseGravityAssistant.new()
    noun, verb =  reverse.calculate(input, 19690720)
    assert_equal(33, noun)
    assert_equal(76, verb)
  end

end
