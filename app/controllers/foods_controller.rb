class FoodsController < ApplicationController
    def index
        @foods = Food.all
        @foods = current_user.foods.all
      end
    
      def new
        @food = Food.new
        @current_user = current_user
      end
    
      def create
        @food = current_user.foods.new(food_params)
        if food_params[:price].to_f.positive?
          if @food.save
            flash[:success] = "#{@food.name} was successfully created"
            redirect_to foods_url
          else
            flash[:alert] = "#{@food.name} was not created"
            redirect_to new_food_url
          end
        else
          flash[:alert] = 'Price must be greater than 0'
          redirect_to new_food_url
        end
      end
    
      def destroy
        @food = Food.find(params[:id])
    
        @check_food = RecipeFood.where(food: @food)
        if @check_food.count.positive?
          flash[:alert] = "#{@food.name} belongs to some recipes"
        else
          flash[:alert] = "#{@food.name} was successfully deleted"
          @food.destroy
        end
        redirect_to foods_url
      end
    
      def food_params
        params.require(:food).permit(:name, :measurementUnit, :price)
      end
end
