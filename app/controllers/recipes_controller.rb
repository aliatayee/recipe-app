class RecipesController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @foods = current_user.foods.all
    @recipe_food = RecipeFood.find_by(recipe_id: params[:id])
  end

  def new
    @recipe = Recipe.new
    respond_to do |format|
      format.html { render :new, locals: { recipe: @recipe } }
    end
  end

  def recipe_params
    params
      .require(:recipe)
      .permit(:name, :description, :public, :preparation_time, :cooking_time)
      .merge(user_id: params[:user_id])
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to user_recipe_path(@recipe.user_id, @recipe.id)
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy
    redirect_to user_recipes_path(@recipe.user_id)
  end

  def public_recipes
    @recipes = Recipe.where(public: true)
  end
end
