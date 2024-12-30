class AddUserGameHistoryIdToGameHistories < ActiveRecord::Migration[6.1]
  def change
    add_column :game_histories, :user_game_history_id, :integer
  end
end
