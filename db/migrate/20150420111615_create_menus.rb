class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.integer :authentication_id
      t.boolean :statu, default: true

      t.timestamps
    end
  end
end
