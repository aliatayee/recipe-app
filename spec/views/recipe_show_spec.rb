require 'rails_helper'
RSpec.describe 'Recipe show', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456')

    @first_recipe = Recipe.create(user: @first_user, name: 'Hello', description: 'This is my first post')

    visit user_recipes_path(@first_user, @first_recipe)
  end

  describe 'Recipe show page' do
    it 'shows the recipe name' do
      expect(page).to have_content @first_recipe.name
    end

    it 'shows who wrote the recipe' do
      expect(page).to have_content @first_recipe.user.name
    end

    it 'shows the recipe description' do
      expect(page).to have_content @first_recipe.description
    end
  end
end
