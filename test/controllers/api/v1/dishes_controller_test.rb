require 'test_helper'

class Api::V1::DishesControllerTest < ActionDispatch::IntegrationTest
  setup do
    pexels_api_mock

    @dish = dishes(:one)
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get '/api/v1/dishes', as: :json
    assert_response :success
  end

  test "should create dish" do
    dish_attributes = {
      name: 'Test case',
      price_in_cents: 7777,
      restaurant_id: @restaurant.id
    }

    assert_difference('Dish.count') do
      post '/api/v1/dishes', params: dish_attributes, as: :json
    end

    assert_response 201
  end

  test "should not create dish with non-existent restaurant_id" do
    dish_attributes = {
      name: 'Test case',
      price_in_cents: 7777,
      restaurant_id: 0
    }

    post '/api/v1/dishes', params: dish_attributes, as: :json

    assert_response 422
  end

  test "should update dish" do
    dish_attributes = {
      name: 'Updated dish',
    }

    patch "/api/v1/dishes/#{@dish.id}", params: dish_attributes, as: :json
    assert_response 200
  end

  test "should destroy dish" do
    assert_difference('Dish.count', -1) do
      delete "/api/v1/dishes/#{@dish.id}", as: :json
    end

    assert_response 200
  end
end
