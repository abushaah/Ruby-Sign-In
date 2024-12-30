class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.integer :num_players
      t.integer :num_sides
      t.integer :num_dice
      t.string :result
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
