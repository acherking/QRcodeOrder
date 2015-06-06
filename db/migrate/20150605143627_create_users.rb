class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :admin, default: false
      t.boolean :zhuachuan, default: false
      t.boolean :chuancai, default: false
      t.boolean :huanzhuo, default: false
      t.boolean :maidan, default: false

      t.timestamps
    end
  end
end
