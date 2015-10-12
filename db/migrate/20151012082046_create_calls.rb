class CreateCalls < ActiveRecord::Migration
  def self.up
    create_table :calls do |t|
      t.string :from_name
      t.string :to_name
      t.string :tel
      t.text :message
      t.integer :status
      t.timestamps null: false
    end
  end
  def self.down
    drop_table :calls
  end
end
