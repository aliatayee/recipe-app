class CreateFood < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :measurement_unit 
      t.decimal :price ssssssssssssssssssssssssss
      t.decimal :quantity
      t.timestamps
    end
  end
end
