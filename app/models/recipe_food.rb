class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food
  validates :quantity, presence: { message: "Quantity can't be null" }
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
