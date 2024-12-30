# Single responsibility of the class is to automate the game by initializing and ending the game, and managing player turns
class AutoDropDead

  # Methods:
  
  # play_game is respnsible for initializing and running the game. It takes the sides, dice count, and player count arguments
  def play_game(sides, dice_count, player_count)
    output = StringIO.new
    $stdout = output

    player_ids = (1..player_count).map { |i| "Player #{i}" }
    game = GamePlay.new(player_ids, dice_count, sides)

    while !game.game_over?
      game.players.each do |player|
        next unless player.active # only active players are in the game
        game.play_turn(player)
        game.remove_players
        break if game.game_over?
      end
    end

    game.end_game

    $stdout = STDOUT
    output.string
  end
  
end
