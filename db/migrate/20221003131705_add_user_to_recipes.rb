class AddUserToRecipes < ActiveRecord::Migration[7.0]
  def change
    t.references :recipes,:user, null: false, index: true, foreign_key: true 

  end
end
