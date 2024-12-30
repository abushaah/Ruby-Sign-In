# Single responsibility of the class is to represent one player.
# It will initialize and remove the player a dice and keep track of player score
class Player

  # Instance Variables:
  # @player_id is the player's player_id
  # @score is the total score
  # @dice is the set of Die objects. "The number of dice can be n where n >= 2"
  # @active tracks if they have been eliminated  or not
  attr_reader :player_id # accessible from GamePlay.rb
  attr_reader :score
  attr_accessor :active
  def initialize(player_id, num_dice = 2, sides = 6)
    @player_id = player_id
    @score = 0
    @dice = Array.new(num_dice) { Die.new(sides) }
    @active = true
  end

  # Methods:

  # roll_dice is responsible for rolling all the players dice. It takes no arguments. It returns the resulting die
  def roll_dice
    @rolls = @dice.map(&:roll_die)
  end

  # update_score sums the score "If none of the dice rolls are a 2 or a 5". It takes the array of rolled dice as arguments
  def update_score(rolls)
    @score += rolls.sum
  end

  # remove_dice removes "all dice showing a 2 and a 5". It takes the array of rolled dice as arguments
  def remove_dice
    @dice.reject! { |die| [2, 5].include?(die.roll) }
    puts "    Remaining number of dice is #{@dice.length}"
  end

  # empty checks if the player has no dice left in the array
  def empty?
    @dice.empty?
  end

  # eliminate "removes the player from the active players" (drop dead)
  def eliminate
    @active = false
  end
end
