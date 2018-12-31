module Api
  module V1
    class RestaurantsController < ApplicationController
      before_action :set_restaurant, only: [:update, :destroy]

      def index
        restaurants = Restaurant.limit(options_params[:limit])

        render json: restaurants
      end

      def list
        restaurants = Restaurant.where(id: restaurants_list_params[:ids])

        render json: restaurants
      end

      def create
        restaurant = Restaurant.create(restaurant_params)

        if restaurant.valid?
          return render json: restaurant, status: :created
        end

        render json: restaurant.errors, status: :unprocessable_entity
      end

      def update
        restaurant = @restaurant.update(restaurant_params)

        return render json: @restaurant if restaurant

        render json: @restaurant.errors, status: :unprocessable_entity
      end

      def destroy
        if !@restaurant
          return render json: { message: 'Record not found' }, status: :unprocessable_entity
        end

        @restaurant.destroy

        render json: :ok
      end

      private

      def options_params
        params.permit(:limit)
      end

      def restaurants_list_params
        params.require(:restaurants).permit(ids: [])
      end

      def restaurant_params
        params.permit(:name)
      end

      def set_restaurant
        @restaurant = Restaurant.find_by(id: params[:id])
      end
    end
  end
end
