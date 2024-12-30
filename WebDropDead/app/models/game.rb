class Game < ApplicationRecord
  belongs_to :user
  has_one :game_history, dependent: :destroy

  validates :num_players, :num_sides, :num_dice, presence: true
  validates :num_sides, numericality: { greater_than_or_equal_to: 2, message: "must be at least 2" }
end
