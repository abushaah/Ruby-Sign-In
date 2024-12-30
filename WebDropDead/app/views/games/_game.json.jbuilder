json.extract! game, :id, :num_players, :num_sides, :num_dice, :result, :user_id, :created_at, :updated_at
json.url game_url(game, format: :json)
