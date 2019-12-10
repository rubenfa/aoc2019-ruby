class GravityAssistant
  def initialize(input)
    @input = input
  end

  def calculate_incode
    process_code(0)
  end

  private

  def process_code(pos)
    return @input if @input.length <= pos
    return @input if @input[pos] == 99

    if recalculate_input(pos) == :jump
      process_code(pos + 4)    
    else
      process_code(pos + 1)    
    end
  end

  def recalculate_input(pos)
    case @input[pos]
    when 1
      add(pos)
      :jump
    when 2
      product(pos)
      :jump
    else
      :no_jump
    end
  end

  def add(pos)
    a,b,p = @input[@input[pos + 1]], @input[@input[pos + 2]], @input[pos + 3]
    @input[p] = a + b
  end

  def product(pos)
    a,b,p = @input[@input[pos + 1]], @input[@input[pos + 2]], @input[pos + 3]
    @input[p] = a * b
  end
end

class ReverseGravityAssistant
  def calculate(input, goal)
    for noun in 0..99
      for verb in 0..99
        original = input.clone
        original[1] = noun
        original[2] = verb

        assistant = GravityAssistant.new(original)
        return noun, verb if assistant.calculate_incode[0] == goal
      end
    end
   end
end

