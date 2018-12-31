class AddSampleImageToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :sample_image, :string
  end
end
