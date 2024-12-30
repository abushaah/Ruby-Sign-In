# Single responsibility of the class is to define player actions and game state (initialize game, remove players, end game)
class GamePlay

  # Instance Variables:
  # @players is the set of Player objects
  # default values are "The number of dice can be n where n >= 2" and "The dice could have s sides where s >= 6"
  attr_reader :players # accessible from AutoDropDead.rb
  # def initialize(player_id, num_dice = 2, sides = 6)
  def initialize(player_id, num_dice, sides)
    @players = player_id.map { |id| Player.new(id, num_dice, sides) }
  end

  # game_over is responsible for checking if all players have no dice left
  def game_over?
    @players.all?(&:empty?)
  end

  # remove_players is responsible for eliminating players with no dice left
  def remove_players
    @players.each do |player|
      if player.empty? && player.active
        player.eliminate
        puts "#{player.player_id} drop dead"
      end
    end
  end

  # play_turn is responsible for playing the turn. It takes the player as arguments
  def play_turn(player)
    puts "#{player.player_id} turn"
    rolls = player.roll_dice
    puts "    Rolled: #{rolls.join(', ')}"

    while !rolls.any? { |roll| roll == 2 || roll == 5 } && !player.empty? do #"If none of the dice rolls are a 2 or a 5"
      player.update_score(rolls) #"Total the dice to produce a point score"
      puts "    Total score sum: #{player.score}"
      rolls = player.roll_dice #"Total the dice to produce a point score"
      puts "    Rolled: #{rolls.join(', ')}"
    end
  
    if rolls.any? { |roll| roll == 2 || roll == 5 } #"When a 2 or a 5 is rolled"
      puts '    No points scored since a 2 or 5 was rolled. Removing die with 2 or 5'
      player.remove_dice #"All dice showing a 2 and a 5 are removed from the player"
    end
  end

  # end_game is responsible for communicating to the player that the game has ended and declaring the winner
  def end_game
    puts 'Game End'
    @players.each do |player|
      puts "#{player.player_id}: #{player.score} points"
    end
    winner = @players.max_by(&:score)
    puts "#{winner.player_id} wins with #{winner.score} points"
  end

end
