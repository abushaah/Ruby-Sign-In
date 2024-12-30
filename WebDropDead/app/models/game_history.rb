class GameHistory < ApplicationRecord
  belongs_to :game
  belongs_to :user

  before_create :set_user_game_history_id

  private

  # game history id based on both user and game (not just auto-incremented value in db)
  def set_user_game_history_id
    max_id = GameHistory.where(user_id: user_id).maximum(:user_game_history_id)
    self.user_game_history_id = max_id ? max_id + 1 : 1
  end
end
