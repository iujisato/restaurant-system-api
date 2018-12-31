class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  before_create do
    self.sample_image = PexelsApi.get_sample_image('restaurant')
  end
end
