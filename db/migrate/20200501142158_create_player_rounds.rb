class CreatePlayerRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :player_rounds do |t|
      t.integer :round_id
      t.integer :player_id
      t.string :role, default: "guesser"
      t.text :guesses, :default => [].to_yaml
      t.timestamps
    end 
  end
end
