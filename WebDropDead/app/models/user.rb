class User < ApplicationRecord
    has_many :games, dependent: :destroy
    has_many :game_histories, through: :games, dependent: :destroy

    validates :username, presence: true
    validates :email, presence: true
    validates :password, presence: true
end
