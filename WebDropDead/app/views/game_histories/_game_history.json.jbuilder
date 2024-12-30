json.extract! game_history, :id, :game_id, :user_id, :date_played, :created_at, :updated_at
json.url game_history_url(game_history, format: :json)
