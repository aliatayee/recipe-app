class ShoppingListController < ApplicationController
  def index
    @total_items = RecipeFood.connection.select_all(
      'SELECT COUNT(DISTINCT "recipe_foods"."food_id") as sum FROM "recipe_foods" '\
      'INNER JOIN recipes ON "recipe_foods"."recipe_id" = recipes.id '\
      "WHERE recipes.user_id = #{current_user.id}"
    )[0]['sum']
    @total_value = RecipeFood.connection.select_all(
      'SELECT  SUM(recipe_foods.quantity * foods.price) '\
      'FROM recipe_foods '\
      'INNER JOIN foods ON recipe_foods.food_id = foods.id '\
      'INNER JOIN recipes ON recipe_foods.recipe_id = recipes.id '\
      "WHERE recipes.user_id = #{current_user.id}"
    )[0]['sum']
    @total_value ||= 0

    @items = RecipeFood.connection.select_all(
      'SELECT name, DT.quantity, "f"."measurement_unit", (DT.quantity * price) as total_price FROM foods AS f '\
      'INNER JOIN(SELECT  food_id, SUM(recipe_foods.quantity) as quantity FROM recipe_foods INNER JOIN foods ON '\
      'recipe_foods.food_id = foods.id group by food_id)as DT ON f.id = DT.food_id '\
      "WHERE f.user_id = #{current_user.id}"
    )
  end
end
