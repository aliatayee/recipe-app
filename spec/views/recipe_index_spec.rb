require 'rails_helper'
RSpec.describe 'Recipe index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456')

    @first_recipe = Recipe.create(user: @first_user, name: 'Hello', description: 'This is my first recipe description')
    @second_recipe = Recipe.create(user: @first_user, name: 'Hola', description: 'This is my second recipe description')
    @third_recipe = Recipe.create(user: @first_user, name: 'Honjour',
                                  description: 'This is my third recipe description')
    @fourth_recipe = Recipe.create(user: @first_user, name: 'Salam',
                                   description: 'This is my fourth recipe description')

    visit user_recipes_path(@first_user)
  end
  describe 'recipe index page' do
    it 'shows the username' do
      expect(page).to have_content @first_user.name
    end

    it 'shows the recipe\'s name' do
      expect(page).to have_content @first_recipe.name
      expect(page).to have_content @second_recipe.name
      expect(page).to have_content @third_recipe.name
      expect(page).to have_content @fourth_recipe.name
    end

    it 'shows some of the recipe\'s descroption' do
      expect(page).to have_content @first_recipe.description[0..20]
      expect(page).to have_content @second_recipe.description[0..20]
      expect(page).to have_content @third_recipe.description[0..20]
      expect(page).to have_content @fourth_recipe.description[0..20]
    end

    it 'shows the button that lets me view all of a user\'s recipes' do
      expect(page).to have_link 'See all Recipes'
    end

    it 'When I click on a recipe, it redirects me to that recipe\'s show page' do
      click_link @first_recipe.name
      expect(page).to have_current_path user_recipe_path(@first_user, @first_recipe)
    end
  end
end
