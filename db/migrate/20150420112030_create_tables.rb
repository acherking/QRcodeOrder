class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.string :name
      t.boolean :statu, default: true

      t.timestamps
    end
  end
end
