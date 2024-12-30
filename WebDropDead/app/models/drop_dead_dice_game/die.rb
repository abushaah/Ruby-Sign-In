# Single responsibility of the class is to represent one die.
# It will "roll" the die by returning a random value
class Die

  # Instance Variables:
  # @sides is the number of sides on the die. It takes the number of sides as an argument. "The dice could have the same number of sides, s, where s >= 6"
  # @roll is the state of the current roll on the die
  attr_reader :roll
  def initialize(sides = 6)
    @sides = sides
    @roll = nil
  end

  # Methods:
  # roll_die is responsible for returning a random number between 1 and the number of sides. It takes no arguments
  def roll_die
    @roll = rand(1..@sides)
  end
end
