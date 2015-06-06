class AddAuthenticationIdToTable < ActiveRecord::Migration
  def change
    add_column :tables, :authentication_id, :integer
  end
end
