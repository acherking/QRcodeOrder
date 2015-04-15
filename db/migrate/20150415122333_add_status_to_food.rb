class AddStatusToFood < ActiveRecord::Migration
  def change
    add_column :foods, :status, :boolean, default: true
  end
end
