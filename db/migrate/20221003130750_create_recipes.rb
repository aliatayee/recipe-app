class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.decimal :preparation_time, default: 0 
      t.decimal :cooking_time, default: 0 
      t.text :description
      t.boolean :public, default: false

      t.timestamps
    end
  end
end
