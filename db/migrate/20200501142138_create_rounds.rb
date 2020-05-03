class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :number
      t.integer :game_id
      t.integer :word_id
      t.boolean :round_in_progress, default: true
      t.timestamps
    end
  end
end
