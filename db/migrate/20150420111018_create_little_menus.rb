class CreateLittleMenus < ActiveRecord::Migration
  def change
    create_table :little_menus do |t|
      t.integer :menu_id
      t.integer :food_id
      t.integer :number, default: 0
      t.string :remark, default: "None"
      t.timestamps
    end
  end
end
