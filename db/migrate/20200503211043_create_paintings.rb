class CreatePaintings < ActiveRecord::Migration[6.0]
  def change
    create_table :paintings do |t|
      t.text :url
      t.integer :round_id

      t.timestamps
    end
  end
end
