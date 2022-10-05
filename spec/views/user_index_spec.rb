require 'rails_helper'
RSpec.describe 'Users index', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'Mustapha', email: 'termus96@gmail.com', password: '123456')
    @second_user = User.create(name: 'Lilly', email: 'lilly@gmail.com', password: '654321')
    @third_user = User.create(name: 'Tom', email: 'tom@gmail.com', password: '741852')
    visit users_path
  end
  describe 'user index page' do
    it 'shows the usernames of all users' do
      expect(page).to have_content @first_user.name
      expect(page).to have_content @second_user.name
      expect(page).to have_content @third_user.name
    end

    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link @first_user.name
      expect(page).to have_current_path user_path(@first_user)
    end
    it 'When I click on a user, I am redirected to that user\'s show page' do
      click_link @second_user.name
      expect(page).to have_current_path user_path(@second_user)
    end
  end
end
