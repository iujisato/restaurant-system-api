require 'test_helper'

class DishTest < ActiveSupport::TestCase
  should validate_presence_of(:name)
  should validate_uniqueness_of(:name).scoped_to(:restaurant_id)
  should belong_to(:restaurant)
end
