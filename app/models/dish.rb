class Dish < ApplicationRecord
  validates :name, presence: true, uniqueness:{ scope: :restaurant }
  belongs_to :restaurant

  before_create do
    self.sample_image = PexelsApi.get_sample_image('dish')
  end
end
