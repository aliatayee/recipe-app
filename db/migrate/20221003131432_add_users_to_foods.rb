class AddUsersToFoods < ActiveRecord::Migration[7.0]
  def change
    t.references :foods,:user, null: false, index: true, foreign_key: true 

  end
end
