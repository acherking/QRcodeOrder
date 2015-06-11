class AddBranchidToFood < ActiveRecord::Migration
  def change
    add_column :foods, :branch_id, :integer
  end
end
