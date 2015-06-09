class AddIndexToAuthenticationsAuthenticationStr < ActiveRecord::Migration
  def change
  	add_index :authentications, :authentication_str, unique: true
  end
end
