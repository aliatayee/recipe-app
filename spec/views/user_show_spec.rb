require 'rails_helper'
RSpec.describe 'User show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Mustapha', email: 'termus96@gmail.com', password: '123456')

    @first_recipe = Recipe.create(user: @first_user, name: 'Hello', description: 'This is my first recipe description')
    @second_recipe = Recipe.create(user: @first_user, name: 'Hola', description: 'This is my second recipe description')
    @third_recipe = Recipe.create(user: @first_user, name: 'Honjour',
                                  description: 'This is my third recipe description')
    @fourth_recipe = Recipe.create(user: @first_user, name: 'Salam',
                                   description: 'This is my fourth recipe description')

    visit user_path(@first_user)
  end

  describe 'user show page' do
    it 'shows the username' do
      expect(page).to have_content @first_user.name
    end

    it 'shows the user\'s first 3 recipes' do
      expect(page).to have_content @first_recipe.name
      expect(page).to have_content @second_recipe.name
      expect(page).to have_content @third_recipe.name
    end

    it 'shows the button that lets me view all of a user\'s recipes' do
      expect(page).to have_link 'See all Recipes'
    end

    it 'When I click on a user recipe, it redirects me to that recipe\'s show page' do
      click_link 'Hello'
      expect(page).to have_current_path user_recipe_path(@first_user, @first_recipe)
    end

    it 'When I click to see all recipes, it redirects me to the user\'s recipe\'s index page' do
      click_link 'See all Recipes'
      expect(page).to have_current_path user_recipes_path(@first_user)
    end
  end
end
