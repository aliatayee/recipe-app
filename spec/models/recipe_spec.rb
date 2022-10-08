require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Tests for Recipe model validation ' do
    @first_user = Recipe.create(name: 'Tom')
    subject { Recipe.new(user: @first_user, name: 'Hello', description: 'This is my first recipe description') }
    before { subject.save }

    it 'name should be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'name should not exceed 250 characters' do
      subject.name = "Lorem Ipsum is simply dummy text of the printing and typesetting industry.
             Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer
             took a galley of type and scrambled it to make a type specimen book.
              It has survived not only five centuries"
      expect(subject).to_not be_valid
    end

    it 'preparation time should not be blank' do
      subject.preparation_time = ''
      expect(subject).to_not be_valid
    end

    it 'cooking time should not be blank' do
      subject.cooking_time = ''
      expect(subject).to_not be_valid
    end
  end
end
