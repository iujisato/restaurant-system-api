require 'test_helper'

class Api::V1::RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    pexels_api_mock

    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get '/api/v1/restaurants', as: :json
    assert_response :success
  end

  test "should return list of requested restaurants" do
    post '/api/v1/restaurants/list',
      params: {restaurants: { ids: [@restaurant.id] }},
      as: :json

    parsedResponse = JSON.parse(@response.body)

    assert_equal(1, parsedResponse.length)
    assert_equal(@restaurant.id, parsedResponse.first['id'])
  end

  # def list
  #   restaurants = Restaurant.where(id: restaurants_list_params[:ids])
  #
  #   render json: restaurants
  # end

  test "should create restaurant" do
    restaurant_attributes = {
      name: 'Test case',
    }

    assert_difference('Restaurant.count') do
      post '/api/v1/restaurants', params: restaurant_attributes, as: :json
    end

    assert_response 201
  end

  test "should update restaurant" do
    restaurant_attributes = {
      name: 'Test case',
    }

    patch "/api/v1/restaurants/#{@restaurant.id}", params: restaurant_attributes, as: :json
    assert_response 200
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete "/api/v1/restaurants/#{@restaurant.id}", as: :json
    end

    assert_response 200
  end

  test "should destroy restaurant and associated dishes" do
    assert_difference('Dish.count', -1) do
      delete "/api/v1/restaurants/#{@restaurant.id}", as: :json
    end
  end
end
