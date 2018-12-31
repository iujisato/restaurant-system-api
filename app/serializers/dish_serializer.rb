class DishSerializer < ActiveModel::Serializer
  belongs_to :restaurant
  attributes :id, :name, :price_in_cents, :sample_image, :restaurant

  def restaurant
    {
      id: object.restaurant.id,
      name: object.restaurant.name
    }
  end
end
