class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :food_type_id
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
