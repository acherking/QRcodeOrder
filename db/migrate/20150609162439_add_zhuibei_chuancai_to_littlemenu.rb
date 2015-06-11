class AddZhuibeiChuancaiToLittlemenu < ActiveRecord::Migration
  def change
    add_column :little_menus, :zhunbei, :boolean, default: false
    add_column :little_menus, :chuancai, :boolean, default: false
  end
end
