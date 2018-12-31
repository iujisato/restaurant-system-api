class CreateDishes < ActiveRecord::Migration[5.2]
  def change
    create_table :dishes do |t|
      t.string :name, null: false
      t.integer :price_in_cents, null: false
      t.string :sample_image
      t.references :restaurant, foreign_key: true, null: false

      t.timestamps
    end
    add_index :dishes, :name
    add_index :dishes, [:name, :restaurant_id], unique: true
  end
end
