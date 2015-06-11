class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :authentication_str
      t.integer :table_id
      t.boolean :statu, default: true

      t.timestamps
    end
  end
end
