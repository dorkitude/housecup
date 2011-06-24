class CreateDelta < ActiveRecord::Migration
  def self.up
    create_table :delta do |t|
      t.integer :quantity
      t.string :why
      t.references :house

      t.timestamps
    end
  end

  def self.down
    drop_table :delta
  end
end
