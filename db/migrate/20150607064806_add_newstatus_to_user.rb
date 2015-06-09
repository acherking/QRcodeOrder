class AddNewstatusToUser < ActiveRecord::Migration
  def change
    add_column :users, :liangcai, :boolean, default: false
    add_column :users, :jiushui, :boolean, default: false
    add_column :users, :zhuchang, :boolean, default: false
  end
end
