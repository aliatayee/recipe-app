require 'rails_helper'
RSpec.describe 'Public Recipes', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '123456')

    @first_recipe = Recipe.create(user: @first_user, name: 'Hello',
                                  description: 'This is my first recipe description', public: true)
    @second_recipe = Recipe.create(user: @first_user, name: 'Hola',
                                   description: 'This is my second recipe description', public: true)
    @third_recipe = Recipe.create(user: @first_user, name: 'Honjour',
                                  description: 'This is my third recipe description', public: true)
    @fourth_recipe = Recipe.create(user: @first_user, name: 'Salam',
                                   description: 'This is my fourth recipe description', public: true)

    visit user_recipes_path(@first_user)
  end

  describe 'Public Recipes page' do
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
