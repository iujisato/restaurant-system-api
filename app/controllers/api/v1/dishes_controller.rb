module Api
  module V1
    class DishesController < ApplicationController
      before_action :set_dish, only: [:update, :destroy]
      def index
        dishes = Dish.limit(options_params[:limit])

        render json: dishes
      end

      def create
        dish = Dish.create(dish_params)

        if dish.valid?
          return render json: dish, status: :created
        end

        render json: dish.errors, status: :unprocessable_entity
      end

      def update
        dish = @dish.update(dish_params)

        return render json: @dish if dish

        render json: @dish.errors, status: :unprocessable_entity
      end

      def destroy
        if !@dish
          return render json: { message: 'Record not found' }, status: :unprocessable_entity
        end

        @dish.destroy

        render json: :ok
      end

      private

      def options_params
        params.permit(:limit)
      end

      def dish_params
        params.permit(:name, :price_in_cents, :restaurant_id)
      end

      def set_dish
        @dish = Dish.find_by(id: params[:id])
      end
    end
  end
end
