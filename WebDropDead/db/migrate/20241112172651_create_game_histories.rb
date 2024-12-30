class CreateGameHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :game_histories do |t|
      t.references :game, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.datetime :date_played

      t.timestamps
    end
  end
end
